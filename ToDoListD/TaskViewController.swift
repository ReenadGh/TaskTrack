//
//  TaskViewController.swift
//  ToDoListD
//
//  Created by Reenad gh on 15/05/1443 AH.
//

import UIKit

class TaskViewController: UIViewController {
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var desTF: UITextField!

    
   weak var taskDataBus : TaskDataBus?
    @IBAction func addTaskButtonPruss(_ sender: Any) {
        
       taskDataBus?.saveTaskData(title: titleTF.text!, dec: desTF.text!, date: datePicker.date)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTF.layer.cornerRadius = 15.0
        desTF.layer.cornerRadius = 15.0
        addButton.layer.cornerRadius = 20.0

        
    }}

