//
//  ViewController.swift
//  Calculator
//
//  Created by Mark Engen on 10/5/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//  https://www.youtube.com/watch?v=GOEPVM5OzJk

import UIKit
//    Class name      Super class it inherits from (optional)
class ViewController: UIViewController {
    //Instance variable == a property
    //"display" is the variable name we gave to the connection
    @IBOutlet var display: UILabel!  //Can hover over the circle to the left to highlight the object in the view.  Also note, @IBOutlet is something Xcode creates (i.e. we don't type it to create a connection).
    //all instances of classes live in the heap and memory is managed for you via reference counting.
    //In this case, the var is initialized and assigned a value.  Had the value not been assigned, it would've needed an initializer to give it a literal value or a parameter argument reference value.
    
    //Due to type inference, the type isn't necessary below
    //var userIsInTheMiddleOfTypingANumber: Bool = false
    var userIsInTheMiddleOfTypingANumber = false
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        //print("digit = \(String(describing: digit))")
    }
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        //{ $0 * $1 } is a function passed as an argument
        //performOperation({ $0 * $1 }) is the same as...
        //performOperation() { $0 * $1 } ...if {$0 * $1 } is last argument which is the same as...
        //performOperation { $0 * $1 } doesn't need the () if it only has one argument
        case "×": performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $0 + $1 }
        case "−": performOperation { $1 - $0 }
        //case "√"
        default: break
            
        }
    }
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    var displayValue: Double {
        get {
            print("\(display.text!)")
            return NumberFormatter().number(from: display.text!)!.doubleValue

        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
            
        }
    }
    
}

