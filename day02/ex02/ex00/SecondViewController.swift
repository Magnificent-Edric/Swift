//
//  SecondViewController.swift
//  ex00
//
//  Created by Magnificent Edric on 8/13/22.
//

import Foundation
import UIKit

class SecondViewController : UIViewController{
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textDeathField: UITextView!
    
    let placeHolderText = "Сause of death"
    let placeHolderColor = UIColor.darkGray
    
    override func viewDidLoad(){
        super.viewDidLoad()
        textDeathField.delegate = self
        textDeathField.layer.borderWidth = 1
        textDeathField.layer.borderColor = UIColor.lightGray.cgColor
        textDeathField.layer.cornerRadius = 10
        textDeathField.text = placeHolderText
        textDeathField.textColor = placeHolderColor
    }
    @IBAction func dataDone(_ sender: UIBarButtonItem) {
        setUpdateData()
        print(textDeathField.text!)
        if datePicker.date < datePicker.minimumDate!{
            datePicker.date = datePicker.minimumDate!
            print(datePicker.date.formatted())
        }else{
            print(datePicker.date.formatted())
        }
        print(nameField.text!)
    }
    
    private func setUpdateData(){
        datePicker.minimumDate = Date()
    }
}

extension SecondViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textDeathField.textColor == placeHolderColor {
            textDeathField.text = nil
            textDeathField.textColor = placeHolderColor
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textDeathField.text.isEmpty{
            textDeathField.text = placeHolderText
            textDeathField.textColor = placeHolderColor
        }
    }
}
