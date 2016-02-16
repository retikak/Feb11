//
//  TaskDetailTableViewController.swift
//  Feb11
//
//  Created by Retika Kumar on 2/11/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    var task: Task?
    
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        updateTask()
        navigationController?.popViewControllerAnimated(true)
        
        
    }
    var dueDateValue: NSDate?
    
    @IBOutlet weak var dueTextField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBAction func userTappedView(sender: UITapGestureRecognizer) {
        
        nameLabel.resignFirstResponder()
        dueTextField.resignFirstResponder()
        
        notesTextView.resignFirstResponder()
        
        
    }
    
    
    @IBAction func datePickerChanged(sender: UIDatePicker)
    
    
    {
        self.dueTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
        
        
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        dueTextField.inputView = dueDatePicker
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let currentTask = task {
            updateWithTask(currentTask)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateTask() {
        
        let name = nameLabel.text!
        let due = dueDateValue
        let notes = notesTextView.text
        
        if let task = self.task {
            task.name = name
            task.due = String(due)
            task.notes = notes
        } else {
            
            let newTask = Task(name: name, notes: notes, due: String(due), isComplete: false)
            TaskController.sharedInstance.addTask(newTask)
        }
    }

    
    
    
    
    
    
    func updateWithTask(task: Task) {
        nameLabel.text = task.name
        if let dueDate = task.due{
            dueTextField.text = dueDate
                
        }
        if let notes = task.notes {
            notesLabel.text = notes
        }
        
    }
}


