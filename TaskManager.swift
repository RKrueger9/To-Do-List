//
//  TaskManager.swift
//  To Do List
//
//  Created by RKrueger on 11/29/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task
{
    var name = "Name"
    var desc = "Description"
}

class TaskManager: NSObject
{
    var tasks = [task]()
    
    func addTask(name: String, desc: String)
    {
        tasks.append(task(name: name, desc: desc))
    }
    
    func decode(coder aDecoder: NSCoder)
    {
        tasks = [aDecoder.decodeObject(forKey: "tasks") as! task]
    }
    
    //used for saving
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(tasks,forKey: "tasks")
        
        
    }

}
