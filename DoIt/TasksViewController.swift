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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks();
        tableView.reloadData(); // Reload tasks when added so new one shows up
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count; // Set the number of rows to be the number of items in tasks array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell();
        let task = tasks[indexPath.row]; // Fill cells with items in tasks
        if(task.important) {
            cell.textLabel?.text = "❗️\(String(describing: task.name!))"; // If task is important, add ! in front of it
        } else {
            cell.textLabel?.text = task.name!; // Otherwise default to name
        }
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row];
        performSegue(withIdentifier: "selectTaskSegue", sender: task);
        
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task];
            print(tasks);
        } catch {
            print("OOPS ERROR");
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController;
            nextVC.task = sender as? Task;
        }
    }
}

