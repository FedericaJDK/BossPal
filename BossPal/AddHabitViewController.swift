//
//  AddHabitViewController.swift
//  BossPal
//
//  Created by Federica D’Alvano on 6/30/22.
//

import UIKit
import CoreData

class AddHabitViewController: UIViewController {
    
    var previousVC = HabitTableViewController()

    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var importantLabel: UILabel!
    
    @IBAction func addButton(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
    }
        let context = appDelegate.persistentContainer.viewContext
    
        let toDo = HabitCD(context: context)
        
        toDo.habitName = titleTextField.text
        toDo.priority = importantSwitch.isOn
        
        appDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
