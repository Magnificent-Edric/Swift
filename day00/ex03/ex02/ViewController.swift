//
//  ViewController.swift
//  ex02
//
//  Created by Magnificent Edric on 8/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    var consoleNum: Double = 0
    var numbers: [Double] = []
    var operators: [Int] = []
    var nig: [Int] = []
    var j: Int = 0
    var i: Int = 0
    var b: Int = 0
    var result: Double = 0
    var mathemSign: Bool = false
    var operatorName: Int = 0
    var signalAC: Int = 0
    var signalNEG: Int = 0
    var equalSym: Int = 0
    var flgForEqual: Bool = false
    
    @IBAction func digitelButton(_ sender: UIButton) {
        if labelResult.text! == "0"{
            labelResult.text = ""
        }
        if mathemSign == true{
            labelResult.text! = String(sender.tag)
            mathemSign = false
        }
        else{
            if sender.tag != 10{
                labelResult.text = labelResult.text! + String(sender.tag)
            }
        }
        consoleNum = Double(labelResult.text!)!
        if sender.tag == 10 {
            consoleNum *= -1
        }
    }
    
    
    @IBAction func operations(_ sender: UIButton) {
        mathemSign = true
        if sender.tag == 11{
            labelResult.text = "0"
            numbers.removeAll()
            operators.removeAll()
            j = 0
            i = 0
            consoleNum = 0
            mathemSign = false
            flgForEqual = true
        }
        if flgForEqual == false{
                numbers.append(consoleNum)
        }
        else{
            flgForEqual = false
        }
        if sender.tag == 12 || sender.tag == 13 || sender.tag == 14 || sender.tag == 15{
            operators.append(sender.tag)
        }
        if sender.tag == 16 {
            while j < numbers.count - 1 && j <= operators.count - 1{
                if operators[i] == 12{
                    if numbers[j + 1] != 0{
                        result = numbers[j] / numbers[j + 1]
                    }else {
                        labelResult.text = "Error"
                        break
                    }
                }
                else if operators[i] == 13{
                    result = numbers[j] * numbers[j + 1]
                }
                else if operators[i] == 14{
                    result = numbers[j] - numbers[j + 1]
                }
                else if operators[i] == 15{
                    result = numbers[j] + numbers[j + 1]
                }
                numbers[j + 1] = result
                j += 1
                i += 1
                printLabel(result)
            }
            numbers.removeAll()
            operators.removeAll()
            j = 0
            i = 0
            consoleNum = 0
            flgForEqual = true
            numbers.append(result)
        }
    }
    
    func    printLabel(_ number: Double){
        if number.isZero{
            labelResult.text = "0"
        }else{
            let arr = String(number)
            let splitedArr = arr.components(separatedBy: ".")
            labelResult.text = splitedArr.last == "0" ? splitedArr.first : arr
        }
    }
    
    @IBAction func printButtonForDebug(_ sender: UIButton) {
        switch sender.tag{
        case 0...9: print(sender.tag)
        case 10: print("NEG:", sender.tag)
        case 11: print("AC:", sender.tag)
        case 12: print("/:", sender.tag)
        case 13: print("*:", sender.tag)
        case 14: print("-:", sender.tag)
        case 15: print("+:", sender.tag)
        case 16: print("=:", sender.tag)
        default:
            print("Error")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

