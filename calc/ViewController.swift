//
//  ViewController.swift
//  calc
//
//  Created by user on 08.10.2022.
//

import UIKit

class ViewController: UIViewController {

    var operation = ""
    var numberOne = ""
    var numberTwo = ""
    var numberMem = ""
    let minLabelFS = 48
  
    @IBOutlet weak var resultLabel: UILabel!
    // @IBOutlet weak var fontSizeStepper: UIStepper
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // make round buttons
        for view in self.view.subviews as [UIView] {
            if let btn = view as? UIButton {
                btn.layer.cornerRadius = btn.frame.width / 2
                btn.titleLabel?.font = UIFont(name: "Helvetica", size: 32)
            }
        }

        // Helvetica 48
        //resultLabel.font = UIFont(name: "Helvetica", size: 150)
        
        // fontSizeStepper.value = 48
    }
    
    @IBAction func inputNumber(_ sender: UIButton) {
        
        numberTwo = numberTwo + (sender.titleLabel?.text)!
        resultLabel.text = numberTwo
    }
    
    @IBAction func clearAct(_ sender: UIButton) {
        operation = ""
        numberOne = ""
        numberTwo = ""
        resultLabel.text = "0"
    }
    
    // обработка нажатия клавиш +,-,/,*
    @IBAction func inputOperation(_ sender: UIButton) {
        if numberTwo.isEmpty { return }
        if !operation.isEmpty { return }
        
        numberOne = numberTwo
        numberTwo = ""

        operation = (sender.titleLabel?.text)!
     }
    
    @IBAction func assignAct(_ sender: UIButton) {
        if operation.isEmpty { return }
        if numberTwo.isEmpty { return }
        if numberOne.isEmpty { return }
        
        var result = 0.0
        
        switch operation {
        case "+": result = Double(numberOne)! + Double(numberTwo)!
        case "-": result = Double(numberOne)! - Double(numberTwo)!
        case "*": result = Double(numberOne)! * Double(numberTwo)!
        case "/": result = Double(numberOne)! / Double(numberTwo)!
        default:
            break
        }
        
        if result.truncatingRemainder(dividingBy: 1.0) == 00 {
            numberTwo = String(Int(result))
        }
        else {
            numberTwo = String(result)
        }
        
        resultLabel.text = numberTwo
        operation = ""
    }
    
    @IBAction func changeFontSize(_ sender: UIStepper) {
        // var curSize:
        let curSize = resultLabel.font.pointSize;
        print( "changeFontSize(): font size: \(curSize)" );
       
        resultLabel.font = resultLabel.font.withSize( Double(minLabelFS) + sender.value )
    }
    
}
