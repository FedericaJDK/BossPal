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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getHabitsToDo()
    }
    
    func getHabitsToDo() {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDos = try? context.fetch(HabitCD.fetchRequest()) as? [HabitCD] {
                habitsToDo = coreDataToDos
                tableView.reloadData()
                
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
        performSegue(withIdentifier: "completeR", sender: toDo)
    }
    
}
