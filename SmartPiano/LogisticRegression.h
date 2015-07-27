//
//  LogisticRegression.h
//  SmartPiano
//
//  Created by Tran Duc Hieu on 7/12/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

#ifndef __SmartPiano__LogisticRegression__
#define __SmartPiano__LogisticRegression__

#include <stdio.h>

#endif /* defined(__SmartPiano__LogisticRegression__) */

#ifdef __cplusplus

extern "C" {
#endif
    typedef std::vector<std::vector<double> > matrix_t;
    typedef std::vector<double> vector_t;
    void sizeMatrix(matrix_t &matrix,int row,int col);
    void error(string s);
    bool realnum(double d);
    void multMatrix(std::vector<std::vector<double> > & a,
                    std::vector<std::vector<double> > & b,
                    std::vector<std::vector<double> > & c);
    double pythag(const double a, const double b);
    bool svdcmp(std::vector<std::vector<double> > & a,
                std::vector<double> & w,
                std::vector<std::vector<double> > &v);
    std::vector< std::vector<double> > svd_inverse(std::vector< std::vector<double> > & u , bool & flag );
    
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
        bool checkVIF();
        LogisticModel(int marker,int phe,matrix_t &ind2marker,vector< vector<bool> > &ind2phe,matrix_t &cov);
        ~LogisticModel();
        void fitLM();
        vector_t getVar();
        double getAssociationStat(int testParameter);
    };        
#ifdef __cplusplus
    
}
#endif