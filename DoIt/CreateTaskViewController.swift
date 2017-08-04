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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // Button to add a task
    @IBAction func addTapped(_ sender: Any) {
        
        // Create a task from the outlet information
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
        
        let task = Task(context: context);
        
        task.name = taskNameTextField.text!;
        task.important = importantSwitch.isOn;
        (UIApplication.shared.delegate as! AppDelegate).saveContext();
        
        // Pop back
        navigationController!.popViewController(animated: true);
    }

}
