//
//  SecondViewController.swift
//  ToDo List
//
//  Created by Rishav Pandey on 08/12/16.
//  Copyright © 2016 AviaBird. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var itemToAdd: UITextField!
    
    @IBAction func addButton(_ sender: AnyObject) {
        let item = UserDefaults.standard.object(forKey: "TODO")
        var list:[String]
        if let tempItem = item as? [String] {
            list = tempItem
            list.append(itemToAdd.text!)
        } else {
            list = [itemToAdd.text!]
        }
        UserDefaults.standard.set(list, forKey: "TODO")
        itemToAdd.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

