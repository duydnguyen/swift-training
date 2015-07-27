//
//  LogisticRegression.cpp
//  SmartPiano
//
//  Created by Tran Duc Hieu on 7/12/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

#include "LogisticRegression.h"
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <iostream>
#include <algorithm>
#include <cassert>
#include <string>
#include <cmath>
#include <vector>
#include <sstream>

using namespace std;

typedef vector<vector<double> > matrix_t;
typedef vector<double> vector_t;

//resize the matrix to row x col, and clear to zero.
inline void sizeMatrix(matrix_t &matrix,int row,int col)
{
    matrix.resize(row);
    for (int i=0;i<row;++i){
        matrix[i].resize(col);
        for (int j=0;j<col;++j){
            matrix[i][j]=0;
        }
    }
}

//report errors
inline void error(string s)
{
    cerr << s << endl;
    assert(false);
}

inline bool realnum(double d)
{
    double zero = 0;
    if (d != d || d == 1/zero || d == -1/zero){
        return false;
    } else {
        return true;
    }
}

//==============from helper.h======================
template<class T>
inline const T SQR(const T a) {return a*a;}

template<class T>
inline const T MAX(const T &a, const T &b)
{return b > a ? (b) : (a);}

template<class T>
inline const T MIN(const T &a, const T &b)
{return b < a ? (b) : (a);}

template<class T>
inline const T SIGN(const T &a, const T &b)
{return b >= 0 ? (a >= 0 ? a : -a) : (a >= 0 ? -a : a);}

template<class T>
inline void SWAP(T &a, T &b)
{T dum=a; a=b; b=dum;}

//===============from stats.cpp====================

void multMatrix(vector<vector<double> > & a,
                vector<vector<double> > & b,
                vector<vector<double> > & c)
{
    
    int ar = a.size();
    int br = b.size();
    if (ar == 0 || br == 0)
        error("Internal error: multiplying 0-sized matrices");
    
    int ac = a[0].size();
    int bc = b[0].size();
    if ( ac != br )
        error("Internal error: non-conformable matrices in multMatrix()");
    
    int cr = ar;
    int cc = bc;
    
    c.clear();
    sizeMatrix(c,cr,cc);
    
    for (int i=0; i<ar; i++)
        for (int j=0; j<bc; j++)
            for (int k=0; k<ac; k++)
                c[i][j] += a[i][k] * b[k][j];
    
}

double pythag(const double a, const double b)
{
    double absa,absb;
    
    absa=fabs(a);
    absb=fabs(b);
    if (absa > absb) return absa*sqrt(1.0+SQR(absb/absa));
    else return (absb == 0.0 ? 0.0 : absb*sqrt(1.0+SQR(absa/absb)));
}

// compute singular value decomposition
bool svdcmp(vector<vector<double> > & a,
            vector<double> & w,
            vector<vector<double> > &v)
{
    bool flag;
    int i,its,j,jj,k,l,nm;
    double anorm,c,f,g,h,s,scale,x,y,z;
    double volatile temp;
    
    int m=a.size();
    if (m==0) error("Internal problem in SVD function (no observations left?)");
    int n=a[0].size();
    
    vector<double> rv1(n);
    g=scale=anorm=0.0;
    for (i=0;i<n;i++) {
        l=i+2;
        rv1[i]=scale*g;
        g=s=scale=0.0;
        if (i < m) {
            for (k=i;k<m;k++) scale += fabs(a[k][i]);
            if (scale != 0.0) {
                for (k=i;k<m;k++) {
                    a[k][i] /= scale;
                    s += a[k][i]*a[k][i];
                }
                f=a[i][i];
                g = -SIGN(sqrt(s),f);
                h=f*g-s;
                a[i][i]=f-g;
                for (j=l-1;j<n;j++) {
                    for (s=0.0,k=i;k<m;k++) s += a[k][i]*a[k][j];
                    f=s/h;
                    for (k=i;k<m;k++) a[k][j] += f*a[k][i];
                }
                for (k=i;k<m;k++) a[k][i] *= scale;
            }
        }
        w[i]=scale *g;
        g=s=scale=0.0;
        if (i+1 <= m && i+1 != n) {
            for (k=l-1;k<n;k++) scale += fabs(a[i][k]);
            if (scale != 0.0) {
                for (k=l-1;k<n;k++) {
                    a[i][k] /= scale;
                    s += a[i][k]*a[i][k];
                }
                f=a[i][l-1];
                g = -SIGN(sqrt(s),f);
                h=f*g-s;
                a[i][l-1]=f-g;
                for (k=l-1;k<n;k++) rv1[k]=a[i][k]/h;
                for (j=l-1;j<m;j++) {
                    for (s=0.0,k=l-1;k<n;k++) s += a[j][k]*a[i][k];
                    for (k=l-1;k<n;k++) a[j][k] += s*rv1[k];
                }
                for (k=l-1;k<n;k++) a[i][k] *= scale;
            }
        }
        anorm=MAX(anorm,(fabs(w[i])+fabs(rv1[i])));
    }
    for (i=n-1;i>=0;i--) {
        if (i < n-1) {
            if (g != 0.0) {
                for (j=l;j<n;j++)
                    v[j][i]=(a[i][j]/a[i][l])/g;
                for (j=l;j<n;j++) {
                    for (s=0.0,k=l;k<n;k++) s += a[i][k]*v[k][j];
                    for (k=l;k<n;k++) v[k][j] += s*v[k][i];
                }
            }
            for (j=l;j<n;j++) v[i][j]=v[j][i]=0.0;
        }
        v[i][i]=1.0;
        g=rv1[i];
        l=i;
    }
    for (i=MIN(m,n)-1;i>=0;i--) {
        l=i+1;
        g=w[i];
        for (j=l;j<n;j++) a[i][j]=0.0;
        if (g != 0.0) {
            g=1.0/g;
            for (j=l;j<n;j++) {
                for (s=0.0,k=l;k<m;k++) s += a[k][i]*a[k][j];
                f=(s/a[i][i])*g;
                for (k=i;k<m;k++) a[k][j] += f*a[k][i];
            }
            for (j=i;j<m;j++) a[j][i] *= g;
        } else for (j=i;j<m;j++) a[j][i]=0.0;
        ++a[i][i];
    }
    for (k=n-1;k>=0;k--) {
        for (its=0;its<30;its++) {
            flag=true;
            for (l=k;l>=0;l--) {
                nm=l-1;
                temp=fabs(rv1[l])+anorm;
                if (temp == anorm) {
                    flag=false;
                    break;
                }
                temp=fabs(w[nm])+anorm;
                if (temp == anorm) break;
            }
            if (flag) {
                c=0.0;
                s=1.0;
                for (i=l;i<k+1;i++) {
                    f=s*rv1[i];
                    rv1[i]=c*rv1[i];
                    temp = fabs(f)+anorm;
                    if (temp == anorm) break;
                    g=w[i];
                    h=pythag(f,g);
                    w[i]=h;
                    h=1.0/h;
                    c=g*h;
                    s = -f*h;
                    for (j=0;j<m;j++) {
                        y=a[j][nm];
                        z=a[j][i];
                        a[j][nm]=y*c+z*s;
                        a[j][i]=z*c-y*s;
                    }
                }
            }
            z=w[k];
            if (l == k) {
                if (z < 0.0) {
                    w[k] = -z;
                    for (j=0;j<n;j++) v[j][k] = -v[j][k];
                }
                break;
            }
            if (its == 29)
                return false; // cannot converge: multi-collinearity?
            x=w[l];
            nm=k-1;
            y=w[nm];
            g=rv1[nm];
            h=rv1[k];
            f=((y-z)*(y+z)+(g-h)*(g+h))/(2.0*h*y);
            g=pythag(f,1.0);
            f=((x-z)*(x+z)+h*((y/(f+SIGN(g,f)))-h))/x;
            c=s=1.0;
            for (j=l;j<=nm;j++) {
                i=j+1;
                g=rv1[i];
                y=w[i];
                h=s*g;
                g=c*g;
                z=pythag(f,h);
                rv1[j]=z;
                c=f/z;
                s=h/z;
                f=x*c+g*s;
                g=g*c-x*s;
                h=y*s;
                y *= c;
                for (jj=0;jj<n;jj++) {
                    x=v[jj][j];
                    z=v[jj][i];
                    v[jj][j]=x*c+z*s;
                    v[jj][i]=z*c-x*s;
                }
                z=pythag(f,h);
                w[j]=z;
                if (z) {
                    z=1.0/z;
                    c=f*z;
                    s=h*z;
                }
                f=c*g+s*y;
                x=c*y-s*g;
                for (jj=0;jj<m;jj++) {
                    y=a[jj][j];
                    z=a[jj][i];
                    a[jj][j]=y*c+z*s;
                    a[jj][i]=z*c-y*s;
                }
            }
            rv1[l]=0.0;
            rv1[k]=f;
            w[k]=x;
        }
    }
    return true;
}

// invert matrix using SVD
vector< vector<double> > svd_inverse(vector< vector<double> > & u , bool & flag )
{
    
    const double eps = 1e-24;
    
    if (u.size() == 0)
        error("Internal problem: matrix with no rows (inverse function)");
    if (u.size() != u[0].size() )
        error("Internal problem: Cannot invert non-square matrix");
    int n = u.size();
    
    vector<double> w(n,0);
    
    vector<vector<double> > v(n);
    for (int i=0; i<n; i++)
        v[i].resize(n,0);
    flag = svdcmp(u,w,v);
    
    // Look for singular values
    double wmax = 0;
    for (int i=0; i<n; i++)
        wmax = w[i] > wmax ? w[i] : wmax;
    double wmin = wmax * eps;
    for (int i=0; i<n; i++)
    {
        w[i] = w[i] < wmin ? 0 : 1/w[i];
    }
    
    // u w t(v)
    
    // row U * 1/w
    
    // results matrix
    vector<vector<double> > r(n);
    for (int i=0; i<n; i++)
    {
        r[i].resize(n,0);
        for (int j=0; j<n; j++)
            u[i][j] = u[i][j] * w[j];
    }
    
    // [nxn].[t(v)]
    for (int i=0; i<n; i++)
        for (int j=0; j<n; j++)
            for (int k=0; k<n; k++)
                r[i][j] += u[i][k] * v[j][k];
    
    return r;
}

//=================from logistic.cpp=========================

const int mAA = 0;
const int mAB = 1;
const int mBB = 2;

class LogisticModel{
private:
    
    int nind;       // number of individuals: nind = N - (# missing values in marker col)
    int np;         // number of regressors:  np = C+2
    
    // logistic model: Y ~ logistic(X * coef)
    vector<bool> Y; // size(Y) = nind, whether a individual has the phenotype
    matrix_t X;     // size(X) = nind * np
    // - all-1s vector (const term)
    // - marker vector
    // - C covariate vectors
    vector_t coef;  // size(coef) = np
    
    // variables used internally by fitLM()
    matrix_t S;     // size(S) = np*np, covariance between regressors
    vector_t p;     // probabilities: logistic(X * coef)
    vector_t V;     // diagonal p(1-p)
    
    bool all_valid; // flag to record errors
    
public:
    //=================from model.cpp============================
    
    /**
     * Check for multicollinearity (near-dependence of regressors, i.e., columns of X)
     * Set all_valid = false (and subsequently Z=0) in the rare case of multicollinearity
     */
    bool checkVIF()
    {
        // Variance Inflation Factor
        // Calculate correlation matrix for X
        // Skip intercept (all-1s vector stored in first col of X)
        
        int p = X.size();
        if (p<2) return false;
        
        int q = X[0].size() - 1;
        if ( q < 2 ) return true;
        
        vector_t m(q);
        matrix_t c;
        sizeMatrix(c,q,q);
        
        for (int i=0; i<p; i++)
            for (int j=0; j<q; j++)
                m[j] += X[i][j+1];
        
        for (int j=0; j<q; j++)
            m[j] /= (double)p;
        
        for (int i=0; i<p; i++)
            for (int j1=0; j1<q; j1++)
                for (int j2=j1; j2<q; j2++)
                    c[j1][j2] += ( X[i][j1+1] - m[j1] ) * ( X[i][j2+1] - m[j2] );
        
        for (int j1=0; j1<q; j1++)
            for (int j2=j1; j2<q; j2++)
                c[j1][j2] /= (double)(p-1);
        
        for (int j1=0; j1<q; j1++)
            for (int j2=j1+1; j2<q; j2++)
            {
                c[j1][j2] /= sqrt( c[j1][j1] * c[j2][j2] );
                c[j2][j1] = c[j1][j2];
                
                if ( c[j2][j1] > 0.999 )
                {
                    return false;
                }
            }
        
        // Any item with zero variance?
        for (int j=0; j<q; j++)
        {
            if ( c[j][j] == 0 || ! realnum( c[j][j] ) )
                return false;
            c[j][j] = 1;
        }
        
        // Get inverse
        bool flag = true;
        c = svd_inverse(c,flag);
        if ( ! flag ) all_valid = false;
        
        // Calculate VIFs
        double maxVIF = 0;
        for (int j=0;j<q;j++)
        {
            // r^2 = 1 - 1/x where x is diagonal element of inverted
            // correlation matrix
            // As VIF = 1 / ( 1 - r^2 ) , implies VIF = x
            
            if ( c[j][j] > 50 ) //par::vif_threshold = 50 in options.cpp, default
                return false;
        }
        return true;
    }
    // Stop at June 23rd, 2015
    LogisticModel(int marker,int phe,matrix_t &ind2marker,vector< vector<bool> > &ind2phe,matrix_t &cov)
    {
        all_valid=true;// initially all valid
        
        X.clear();
        Y.clear();
        int N=ind2marker.size(); // the number of individuals
        for (int i=0;i<N;++i){ // loop over all individuals
            // append phenotype of i-th individual
            Y.push_back(ind2phe[i][phe]);
            
            // build row of X corresponding to i-th individual
            X.push_back(vector<double>());
            
            // first col of X is all-1s for constant term
            X.back().push_back(1);
            
            // second col is marker value
            int markerValue = 0;
            bool skip = false; // check missing values
            if ((int)ind2marker[i][marker] == 0) {
                // 1 1 --> false false
                markerValue = mBB;
            }else if ((int)ind2marker[i][marker] == 1) {
                // 1 2 --> false true
                markerValue = mAB;
            }else if ((int)ind2marker[i][marker] == 2) {
                // 2 2 --> true true
                markerValue = mAA;
            }else if ((int)ind2marker[i][marker] == 9) { // missing value
                // 0 0 --> true false
                skip = true;
                markerValue = 0;
            }
            if (skip == true) { // if marker has missing value, ignore this individual
                X.pop_back();
                Y.pop_back();
                continue;
            }
            X.back().push_back(markerValue);
            
            // last C cols are covariate values
            for (int j=0;j<(int)cov[i].size();++j){ // loop over covariates
                X.back().push_back(cov[i][j]);
            }
        }
        nind=Y.size();  // get the number of individuals
        np=X[0].size(); // get the number of regressors
        
        // reserve space
        p.resize(nind);
        V.resize(nind);
    }
    
    // destructor
    ~LogisticModel() {}
    
    // fit the logistic model
    void fitLM(){
        // check for multicollinearity; quit if columns of X are near-dependent
        all_valid &= checkVIF();
        
        coef.resize(np);
        sizeMatrix(S,np,np);
        
        if (np==0 || nind==0 || !all_valid){
            return;
        }
        ///////////////////////////////////////
        // Newton-Raphson to fit logistic model
        bool converge=false;
        for (int it=0;it<20 && !converge;++it){
            // Determine p and V
            for (int i=0;i<nind;++i){
                double t=0;
                for (int j=0;j<np;++j){
                    t+=coef[j]*X[i][j];
                }
                p[i]=1/(1+exp(-t));
                V[i]=p[i]*(1-p[i]);
            }
            // Update coefficients (equivalent R code in comment)
            // b <- b + solve( t(X) %*% V %*% X ) %*% t(X) %*% ( y - p )
            matrix_t T;
            sizeMatrix(T,np,np);
            for (int j=0;j<np;++j){
                for (int k=j;k<np;++k){
                    double sum=0;
                    for (int i=0;i<nind;++i){
                        sum+=X[i][j]*V[i]*X[i][k];
                    }
                    T[j][k]=T[k][j]=sum;
                }
            }
            bool flag=true;
            T=svd_inverse(T,flag);
            if (!flag){
                all_valid=false;
                return;
            }
            matrix_t T2;
            // Resize and set elements to 0
            sizeMatrix(T2,np,nind);
            // note implicit transpose of X
            for (int i=0; i<np; i++)
                for (int j=0; j<nind; j++)
                    for (int k=0; k<np; k++)
                        T2[i][j] += T[i][k] * X[j][k];
            vector_t t3(nind);
            for (int i=0; i<nind; i++)
                t3[i] = Y[i] - p[i];
            vector_t ncoef(np);
            for (int j=0; j<np; j++)
                for (int i=0; i<nind; i++)
                    ncoef[j] += T2[j][i] * t3[i];
            // Update coefficients, and check for
            // convergence
            double delta = 0;
            for (int j=0; j<np; j++) {
                delta += abs(ncoef[j]);
                coef[j] += ncoef[j];
            }
            if ( delta < 1e-6 ) {
                converge = true;
            }
        }
        /////////////////////////////////////////
        // Obtain covariance matrix of estimates (equivalent R code in comment)
        
        // S <- solve( t(X) %*% V %*% X )    
        
        // Transpose X and multiple by diagonal V
        matrix_t Xt;
        sizeMatrix(Xt, np, nind);
        for (int i=0; i<nind; i++)
            for (int j=0; j<np; j++) 
                Xt[j][i] = X[i][j] * V[i];
        
        multMatrix(Xt,X,S);  
        bool flag = true;
        S = svd_inverse(S,flag);     
        if ( ! flag ) {
            all_valid = false;
            return;
        }
    }
    
    // return variance of each estimated coefficient
    vector_t getVar()
    {  
        vector_t var(np);
        for (int i=0; i<np; i++)
            var[i] = S[i][i];
        return var;
    }
    
    // return association statistic (chi-square from Wald test) computed by logistic model
    double getAssociationStat(int testParameter)
    {  
        vector_t var = getVar();
        bool okay = var[testParameter] < 1e-20 || !realnum(var[testParameter]) ? false : all_valid;
        //shangjingbo: I think the original code is wrong here, all_valid should be replaced by okay.
        //if (all_valid){
        if (okay){
            double se = sqrt(var[testParameter]);
            double Z = coef[testParameter] / se;	  
            return Z*Z;
        } else{
            return 0;
        }
    }
};

class GWASSpeedup
{
public:
    template <class T>
    void buildMatrix(vector<string> &src,vector< vector<T> > &tar){
        tar.clear();
        int row=src.size();
        tar.resize(row);
        for (int i=0;i<row;++i){
            tar[i].resize(src[i].size());
            for (int j=0;j<(int)src[i].size();++j){
                tar[i][j]=src[i][j]-'0';
            }
        }
    }
    
    vector< vector<bool> > ind2phe;
    vector< vector<double> > ind2marker;
    vector< vector<double> > ind2cov;
    
    vector<double> computeAssociations(vector<string> phenotype, vector<string> genotype, vector<double> covariate){
        buildMatrix(phenotype,ind2phe); // N * P
        buildMatrix(genotype,ind2marker); // N * M
        int N=phenotype.size();
        int C=covariate.size()/N;
        assert(N*C == covariate.size());
        ind2cov.resize(N);
        for (int i=0;i<N;++i){
            ind2cov[i].resize(C);
            for (int j=0;j<C;++j){
                ind2cov[i][j]=covariate[i*C+j];
            }
        }
        int P=ind2phe[0].size();
        int M=ind2marker[0].size();
        cerr << "[GWASSpeedup] N = " << N << " M = " << M << " P = " << P << " C = " << C << endl;
        vector<double> ret;
        for (int i=0;i<M;++i){
            for (int j=0;j<P;++j){
                LogisticModel* model=new LogisticModel(i,j,ind2marker,ind2phe,ind2cov);
                model->fitLM();
                ret.push_back(model->getAssociationStat(1)); // 1 indicates the second col, which holds the marker values
                delete model;
            }
        }
        return ret;
    }
};
