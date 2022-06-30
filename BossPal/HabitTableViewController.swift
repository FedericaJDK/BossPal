//
//  HabitTableViewController.swift
//  BossPal
//
//  Created by Federica D’Alvano on 6/30/22.
//

import UIKit

class HabitTableViewController: UITableViewController {
    
    var habitsToDo: [HabitCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getHabits()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getHabits()
    }
    
    func getHabits() {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDos = try? context.fetch(HabitCD.fetchRequest()) as? [HabitCD] {
                habitsToDo = coreDataToDos
                tableView.reloadData()
                
            }
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habitsToDo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rIdentifier", for: indexPath)

        let toDo = habitsToDo[indexPath.row]
        
        if let habitName = toDo.habitName {
            if toDo.priority {
                cell.textLabel?.text = "❗️" + habitName
              } else {
                cell.textLabel?.text = toDo.habitName
              }
        }
        
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let toDo = habitsToDo[indexPath.row]
        
        performSegue(withIdentifier: "complete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddHabitViewController{
            addVC.previousVC = self;
          }
        
        if let completeVC = segue.destination as? CompleteHabitsViewController {
            if let toDo = sender as? HabitCD {
              completeVC.selectedHabit = toDo
              completeVC.previousVC = self
            }
        }

    }
    
}
