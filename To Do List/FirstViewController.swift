//
//  FirstViewController.swift
//  To Do List
//
//  Created by RKrueger on 11/21/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var cell: UITableViewCell!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        editButton.tag = 0
        self.myTableView.backgroundColor = UIColor.lightGray
        myTableView.reloadData()
        
        let defaults = UserDefaults.standard
        if let savedTask = defaults.object(forKey: "people") as? Data
        {
            //converts data back to an object
            taskMgr.tasks = NSKeyedUnarchiver.unarchiveObject(with: savedTask) as! [task]
        }

    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "myCell")
        
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskMgr.tasks.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            taskMgr.tasks.remove(at:(indexPath).row)
            myTableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let task = taskMgr.tasks[(sourceIndexPath as NSIndexPath).row]
        taskMgr.tasks.remove(at: (sourceIndexPath as NSIndexPath).row)
        taskMgr.tasks.insert(task, at: (destinationIndexPath as NSIndexPath).row)
    }
    
    func tableView(_ tableView: UITableView!, didSelectRowAt indexPath: IndexPath!) {
        print("Row \(indexPath.row) selected")
        let cell: UITableViewCell = myTableView.cellForRow(at: indexPath as IndexPath)!
        if(cell.backgroundColor == UIColor.white)
        {
            cell.backgroundColor = UIColor.green
            let myBackView = UIView(frame: cell.frame);
            cell.selectedBackgroundView = myBackView
        }
        else if(cell.backgroundColor == UIColor.green)
        {
            cell.backgroundColor = UIColor.orange
            let myBackView = UIView(frame: cell.frame);
            cell.selectedBackgroundView = myBackView
        }
        else
        {
            cell.backgroundColor = UIColor.white
            let myBackView = UIView(frame: cell.frame);
            cell.selectedBackgroundView = myBackView
        }
    }

    func save()
    {
        //NSKeyedArchive coverts our array into a data object
        let saveData = NSKeyedArchiver.archivedData(withRootObject: taskMgr.tasks)
        let defaults = UserDefaults.standard
        defaults.set(saveData, forKey: "tasks")
    }

    @IBAction func editbuttonTap(_ sender: UIBarButtonItem)
    {
        if(sender.tag == 0)
        {
            myTableView.isEditing = true
            sender.tag = 1
        }
        else
        {
            myTableView.isEditing = false
            sender.tag = 0
        }

    }
    
   
}
