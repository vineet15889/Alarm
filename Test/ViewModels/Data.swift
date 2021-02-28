//
//  data.swift
//  Test
//
//  Created by Vineet Rai on 28/02/21.
//

import Foundation
class TaskData {
    var taskData:[Task] = [Task()]
    
    func getData() ->[Task]{
        taskData.removeAll()
        for task in 1...6 {
            let newTask = Task.init()
            newTask.label = "Remind me work!"
            newTask.startDate = Date()
            newTask.endDate = Date()
            newTask.taskStatus = true;
           taskData.append(newTask)
        }
        return taskData;
    }
}

