//
//  TasksViewController.swift
//  DoIt
//
//  Created by GREED on 7/29/17.
//  Copyright © 2017 GREED. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks:[Task] = []; // Make an empty array called task
    
    var selectedIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks(); // Call the function makeTasks to create an array of tasks
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count; // Set the number of rows to be the number of items in tasks array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell();
        let task = tasks[indexPath.row]; // Fill cells with items in tasks
        if(task.important) {
            cell.textLabel?.text = "❗️\(task.name)"; // If task is important, add ! in front of it
        } else {
            cell.textLabel?.text = task.name; // Otherwise default to name
        }
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row;
        let task = tasks[indexPath.row];
        performSegue(withIdentifier: "selectTaskSegue", sender: task);
        
    }
    
    // Make function to create array
    func makeTasks() -> [Task] {
        let task1 = Task();
        task1.name = "Walk the dog";
        task1.important = false;
        
        let task2 = Task()
        task2.name = "Buy Cheese";
        task2.important = true;
        
        let task3 = Task()
        task3.name = "Mow the lawn";
        task3.important = false;
        
        return [task1, task2, task3];
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController;
            nextVC.previousVC = self;
        }
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController;
            nextVC.task = sender as! Task;
            nextVC.previousVC = self;
        }
    }
}

