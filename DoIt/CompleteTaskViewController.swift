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
    
    var task:Task? = nil;

    override func viewDidLoad() {
        super.viewDidLoad()

        if(task!.important) {
            taskLabel.text = "❗️\(String(describing: task!.name!))"; // If task is important, add ! in front of it
        } else {
            taskLabel.text = task!.name!; // Otherwise default to name
        }
    }

    @IBAction func completeTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
        context.delete(task!);
        (UIApplication.shared.delegate as! AppDelegate).saveContext();
        
        navigationController!.popViewController(animated: true);
        
    }

}
