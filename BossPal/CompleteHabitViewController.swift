//
//  CompleteHabitViewController.swift
//  BossPal
//
//  Created by Federica D’Alvano on 6/30/22.
//

import UIKit

class CompleteHabitViewController: UIViewController {
    
    var previousVC = HabitTableViewController()
    var selectedHabitsToDo : ToDoCD?
    
    @IBOutlet weak var goalName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goalName.text = selectedHabitsToDo?.habit
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeBtn(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        if let theToDo = selectedHabitsToDo{
            context.delete(theToDo)
        }
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
