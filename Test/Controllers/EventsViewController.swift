//
//  EventsViewController.swift
//  Test
//
//  Created by Vineet Rai on 27/02/21.
//

import UIKit

class EventsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var eventData:[Task] = TaskData.init().getData()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
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
        dateFormater.dateFormat = "MM/dd/yyyy, h:mm a"
        cell.startDate.text = dateFormater.string(from: eventData[indexPath.row].startDate!)
        cell.endDate.text = dateFormater.string(from: eventData[indexPath.row].endDate!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func add(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:AddTaskViewController = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        vc.category = Category.reminder
        vc.action = ActionType.new
        self.present(vc, animated: true)
    }
    
}
