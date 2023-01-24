//
//  MyTableViewCell.swift
//  ex00
//
//  Created by Magnificent Edric on 8/13/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labeldate: UILabel!
    @IBOutlet weak var labelTextDeath: UILabel!
    
    var label: (name: String, death: String, date: String){
        get{
            return (labelName.text!, labeldate.text!, labelTextDeath.text!)
        }set(label){
            labelName.text = label.name
            labelTextDeath.text = label.death
            labeldate.text = label.date
        }
    }

}
