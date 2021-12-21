//
//  ListTableViewController.swift
//  ToDoListD
//
//  Created by Reenad gh on 15/05/1443 AH.
//

import UIKit
import CoreData

var TaskList = [Task]()


class ListTableViewController: UITableViewController , TaskDataBus {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

                fetchData()
  
    
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        cell.titlelbl.text = TaskList[indexPath.row].title
        cell.declbl.text = TaskList[indexPath.row].desc
        cell.datelbl.text =  convertDateToString(date : TaskList[indexPath.row].date!)

        if (TaskList[indexPath.row].status! == "Completed"){
           cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        return cell
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskList.count
    }
    
    func saveTaskData(title: String, dec: String, date: Date) {
        
        addNewTask(title : title , dec : dec , date :date)
        dismiss(animated : true , completion : nil  )
        fetchData()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        deleteTask(removedTask : TaskList[indexPath.row])
        fetchData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        changeStatusToCompleted(editedTask: TaskList[indexPath.row])
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            let navControllar = segue.destination as! TaskViewController
        navControllar.taskDataBus = self
        
    }
    



}



//core data


extension ListTableViewController {
    
    func fetchData(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
                do {
                    let results = try context.fetch(fetchRequest)
                     TaskList = results as! [Task]

                } catch {
                    print("\(error)")
                }
        tableView.reloadData()

    }
    
    
    
    func addNewTask(title : String , dec : String , date :Date)
    {
        
        let newTask = Task(context: self.context)
        newTask.title = title
        newTask.desc = dec
        newTask.date = date
        newTask.status = "unCompleted"

        saveContext()

    }
    
    
    func deleteTask(removedTask : Task){
        context.delete(removedTask)
        saveContext()

        
    }
    
    func changeStatusToCompleted(editedTask : Task){
    
        editedTask.status = "Completed"
        saveContext()

    }
    

    
    
    
    func convertDateToString(date : Date)->String {
        
        let dateFormatter = DateFormatter()
/*
        "y, M d"                 // 2020, 10 29
        "YY, MMM d"              // 20, Oct 29
        "YY, MMM d, hh:mm"       // 20, Oct 29, 02:18
        "YY, MMM d, HH:mm:ss"    // 20, Oct 29, 14:18:31
 */
        dateFormatter.dateFormat =  "YY, MMM d, hh:mm"

       return  dateFormatter.string(from: date)
    }
        
}
