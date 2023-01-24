//
//  ViewController.swift
//  ex01
//
//  Created by Magnificent Edric on 8/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBAction func Button(_ sender: UIButton) {
        Label.text = "Hello World !"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

