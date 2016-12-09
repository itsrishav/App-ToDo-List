//
//  FirstViewController.swift
//  ToDo List
//
//  Created by Rishav Pandey on 08/12/16.
//  Copyright © 2016 AviaBird. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arr:[String] = []
    
    @IBOutlet var tableView: UITableView!
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
            
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let list = UserDefaults.standard.object(forKey: "TODO")
        if let item = list as? [String] {
            arr = item
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            arr.remove(at: indexPath.row)
            UserDefaults.standard.set(arr, forKey: "TODO")
            tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

