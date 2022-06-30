//
//  CompleteHabitsViewController.swift
//  BossPal
//
//  Created by Federica D’Alvano on 6/30/22.
//

import UIKit

class CompleteHabitsViewController: UIViewController {
    var previousVC = HabitTableViewController()
    var selectedHabit : HabitCD?
    
    @IBOutlet weak var goalName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalName.text = selectedHabit?.habitName
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeBtn(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        if let theHabit = selectedHabit{
            context.delete(theHabit)
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
