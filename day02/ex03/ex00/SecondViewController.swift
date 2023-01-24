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
        setUpdateData()
    }
    
    @IBAction func dataDone(_ sender: UIBarButtonItem) {
        let dataVictim: (name: String, causeOfDeath: String, date: String)
        
        setUpdateData()
        if nameField.text!.isEmpty {
            dataVictim.name = ""
        }else{
            dataVictim.name = nameField.text!
        }
        if datePicker.date < datePicker.minimumDate!{
            datePicker.date = datePicker.minimumDate!
            dataVictim.date = datePicker.date.formatted()
        }else{
            dataVictim.date = datePicker.date.formatted()
        }
        if textDeathField.text!.isEmpty {
            dataVictim.causeOfDeath = ""
        }else{
            dataVictim.causeOfDeath = textDeathField.text!
        }
        if dataVictim.name != ""{
            Data.people.append(dataVictim)
        }
        self.navigationController?.popViewController(animated: true)
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
