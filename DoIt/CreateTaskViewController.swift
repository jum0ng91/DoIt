//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by GREED on 7/30/17.
//  Copyright © 2017 GREED. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField! // The name of the task
    @IBOutlet weak var importantSwitch: UISwitch! // Switch for whether task is important or not
    
    var previousVC = TasksViewController(); // Used to communicate with previous viewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // Button to add a task
    @IBAction func addTapped(_ sender: Any) {
        
        // Create a task from the outlet information
        
        let task = Task();
        task.name = taskNameTextField.text!;
        task.important = importantSwitch.isOn;
        
        // Add new task to array in previous viewController
        
        previousVC.tasks.append(task);
        previousVC.tableView.reloadData();
        navigationController!.popViewController(animated: true);
    }

}
