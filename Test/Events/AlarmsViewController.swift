//
//  AlarmsViewController.swift
//  Test
//
//  Created by Vineet Rai on 27/02/21.
//

import UIKit

class AlarmsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,TaskDelegate {

    @IBOutlet weak var tableView: UITableView!
    var alarmData:[Task] = Array<Task>()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reload()
    }
    
    func reload(){
        alarmData = TaskFunctions.init().fetchData(taskType: TaskType.alarm.rawValue)
        tableView.reloadData()
    }
    
    func uiSetup(){
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmData.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:AlarmTableViewCell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmTableViewCell
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy, h:mm a"
        let dateTime = dateFormater.string(from: alarmData[indexPath.row].startDate!).components(separatedBy: ", ")
        cell.date.text = dateTime[0]
        cell.time.text = dateTime[1]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let task = alarmData[indexPath.row]
            TaskFunctions.init().deleteData(task: task)
            reload()
        }
    }
    
    @IBAction func add(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:AddTaskViewController = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        vc.category = TaskType.alarm
        vc.action = ActionType.new
        vc.delegate = self;
        self.present(vc, animated: true)
    }
}
