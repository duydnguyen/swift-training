//
//  ViewController.swift
//  Calculator
//
//  Created by tien on 7/11/14.
//  Copyright (c) 2014 tien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tfResult :UITextField
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func equalClick(sender: AnyObject) {
        var outputStack = Stack();
        var stack = Stack();
        var inputStack = getInputStack(tfResult.text);
        
        while inputStack.isEmpty() == false {
            if isOperator(inputStack.peep()) {
                if inputStack.peep() == "(" {
                    stack.push(inputStack.pop())
                } else if inputStack.peep() == ")" {
                    while stack.peep() != "(" {
                        outputStack.push(stack.pop());
                    }
                    stack.pop()
                    inputStack.pop()
                }else {
                    if !stack.isEmpty() && isOperator(stack.peep()) && getPriority(stack.peep()) > getPriority(inputStack.peep()) {
                        outputStack.push(stack.pop())
                    }
                    stack.push(inputStack.pop());
                }
            } else {
                outputStack.push(inputStack.pop());
            }
        }
        
        while stack.isEmpty() == false {
            outputStack.push(stack.pop())
        }
        while outputStack.isEmpty() == false {
            inputStack.push(outputStack.pop())
        }
        while !inputStack.isEmpty() {
            if isOperator(inputStack.peep()) {
                if stack.array.count >= 2 {
                    var b = stack.pop().bridgeToObjectiveC().floatValue;
                    var a = stack.pop().bridgeToObjectiveC().floatValue;
                    var result:Float = 0;
                    switch inputStack.peep() {
                    case "+": result = a + b;
                    case "-": result = a - b;
                    case "*": result = a * b;
                    case "/": result = a / b;
                    default: break;
                        
                    }
                    
                    stack.push(result.bridgeToObjectiveC().stringValue);
                }else{
                    break;
                }
                inputStack.pop();
                //                stack.push(result)
            }else {
                stack.push(inputStack.pop())
            }
        }
        
        if !inputStack.isEmpty() || stack.isEmpty() || stack.array.count > 1{
            tfResult.text = "ERROR";
        }
        else{
            tfResult.text = stack.pop();
        }
        
        
    }
    
    func getInputStack(inputText : String)->Stack{
        var input = inputText
        var token = "";
        var tmp = Stack();
        var inputStack = Stack();
        while input.utf16count > 0 {
            var op = input.substringToIndex(1);
            if isOperator(op){
                tmp.push(token)
                tmp.push(op);
                token = "";
            }else{
                token += op;
                if input.utf16count == 1{
                    tmp.push(token)
                }
            }
            
            input = input.substringFromIndex(1);
        }
        while tmp.isEmpty() == false {
            inputStack.push(tmp.pop())
        }
        return inputStack;
    }
    
    @IBAction func numClick(sender :AnyObject){
        var text = tfResult.text
        tfResult.text = text + sender.titleForState(UIControlState.Normal);
        
    }
    
    @IBAction func cClick(sender :AnyObject){
        var count = tfResult.text.utf16count;
        if count == 0 {return;}
        var text = tfResult.text.substringToIndex(count - 1)
        tfResult.text = text;
    }
    
    @IBAction func delClick(sender: AnyObject) {
        tfResult.text = "";
    }
    func getPriority(op :String)->Int{
        if op == "*" || op == "/" || op == "%"
        {
            return 2;
        }
        if op == "+" || op == "-"
        {
            return 1;
        }
        return 0;
    }
    
    func isOperator(op:String)->Bool{
        if op == "*" || op == "/" || op == "%" || op == "+" || op == "-" || op == "(" || op == ")"
        {
            return true;
        }
        return false;
        
    }
    
    
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
