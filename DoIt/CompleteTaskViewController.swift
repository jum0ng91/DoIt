//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by GREED on 8/1/17.
//  Copyright © 2017 GREED. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var task = Task();
    var previousVC = TasksViewController(); // Used to communicate with previous viewController

    override func viewDidLoad() {
        super.viewDidLoad()

        if(task.important) {
            taskLabel.text = "❗️\(task.name)"; // If task is important, add ! in front of it
        } else {
            taskLabel.text = task.name; // Otherwise default to name
        }
    }

    @IBAction func completeTapped(_ sender: Any) {
        
        previousVC.tasks.remove(at: previousVC.selectedIndex);
        previousVC.tableView.reloadData();
        navigationController!.popViewController(animated: true);
        
    }

}
