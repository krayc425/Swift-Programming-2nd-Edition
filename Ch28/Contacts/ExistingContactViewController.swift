//
//  ExistingContactViewController.swift
//  Contacts
//
//  Created by 宋 奎熹 on 2017/7/27.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import UIKit

class ExistingContactViewController: UIViewController {
    
    var contact: Contact
    
    @IBOutlet var existingFirstNameTextField: UITextField!
    @IBOutlet var existingLastNameTextField: UITextField!
    
    required init?(coder aDecoder: NSCoder) {
        contact = Contact(name: "")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let names: [String] = contact.name.components(separatedBy: " ")
        existingFirstNameTextField.text = names[0]
        existingLastNameTextField.text = names[1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
