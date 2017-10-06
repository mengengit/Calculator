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
    
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("digit = \(String(describing: digit))")
    }
}

