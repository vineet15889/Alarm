//
//  AddTaskViewController.swift
//  Test
//
//  Created by Vineet Rai on 28/02/21.
//

import UIKit
enum Category:String {
    case alarm
    case reminder
    case event
}
enum ActionType:String {
    case update
    case new
}
class AddTaskViewController: UIViewController {
   
    var category:Category = Category.reminder //default
    var action:ActionType = ActionType.new //default
    
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var time: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func add(_ sender: Any) {
    }
    
}
