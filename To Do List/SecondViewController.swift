//
//  SecondViewController.swift
//  To Do List
//
//  Created by RKrueger on 11/21/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func saveButton(_ sender: AnyObject)
    {
        if (nameTextField.text == ""){
            //Task Title is blank, do not add a record
        } else {
            //add record function
            taskMgr.addTask(name: nameTextField.text!, desc: descTextField.text!)
            
            //dismiss keyboard and reset fields
            nameTextField.resignFirstResponder()
            descTextField.resignFirstResponder()
            nameTextField.text = nil
            descTextField.text = nil
            
        }
    }
    
}

