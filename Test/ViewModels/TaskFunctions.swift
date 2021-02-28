//
//  TaskFunctions.swift
//  Test
//
//  Created by Vineet Rai on 28/02/21.
//

import Foundation
import CoreData

class TaskFunctions {
    static let shared = TaskFunctions()
    func addData(label:String,startDate:Date,endDate:Date,taskStatus:Bool,taskType:String){
        let task = Task(context: PersistentStorage.shared.context)
        task.label = label
        task.startDate = startDate
        task.endDate = endDate
        task.taskStatus = taskStatus
        task.taskType = taskType
        PersistentStorage.shared.saveContext()
    }


    func fetchData(taskType:String) ->[Task]{
        var fetchedResults: Array<Task> = Array<Task>()
        let fetchRequest : NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "taskType == %@", taskType)
        do{
            let result = try PersistentStorage.shared.context.fetch(fetchRequest) 
            fetchedResults = result;
        }catch let error{
            debugPrint(error)
        }
        return fetchedResults;
    }
    
    func deleteData(task:Task){
        PersistentStorage.shared.context.delete(task)
        PersistentStorage.shared.saveContext()
    }
}

