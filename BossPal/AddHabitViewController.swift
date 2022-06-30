//
//  AddHabitViewController.swift
//  BossPal
//
//  Created by Federica D’Alvano on 6/29/22.
//

import UIKit
import CoreData

class AddHabitViewController: UIViewController {
    var previousVC = HabitTrackerTableViewController()
    
    @IBOutlet weak var priorityLabel: UILabel!
    
    @IBOutlet weak var switchImportant: UISwitch!
    @IBOutlet weak var habitTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
    
        let toDo = HabitCD(context: context)
        
        toDo.name = habitTextField.text
        toDo.important = switchImportant.isOn
        
        appDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)

    }

    @IBAction func addButton(_ sender: Any) {
    }
    // Do any additional setup after loading the view.
    
}
    
