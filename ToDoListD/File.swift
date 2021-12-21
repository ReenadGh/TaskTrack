//
//  File.swift
//  ToDoListD
//
//  Created by Reenad gh on 15/05/1443 AH.
//

import Foundation


protocol TaskDataBus  : class{
    
    func saveTaskData(title : String , dec : String , date : Date )
}
