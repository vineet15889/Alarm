//
//  EventsViewController.swift
//  Test
//
//  Created by Vineet Rai on 27/02/21.
//

import UIKit

class EventsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,TaskDelegate {
    @IBOutlet weak var tableView: UITableView!
    var eventData:[Task] = Array<Task>()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reload()
    }
    
    func reload(){
        eventData = TaskFunctions.init().fetchData(taskType: TaskType.event.rawValue)
        tableView.reloadData()
    }
    func uiSetup(){
        tableView.rowHeight = 100.0
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:EventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        cell.label.text = eventData[indexPath.row].label
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy, h:mm a"
        cell.startDate.text = dateFormater.string(from: eventData[indexPath.row].startDate!)
        cell.endDate.text = dateFormater.string(from: eventData[indexPath.row].endDate!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let task = eventData[indexPath.row]
            TaskFunctions.init().deleteData(task: task)
            eventData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func add(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:AddTaskViewController = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        vc.category = TaskType.event
        vc.action = ActionType.new
        vc.delegate = self;
        self.present(vc, animated: true)
    }
    
}
