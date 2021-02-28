//
//  AlarmNotification.swift
//  Test
//
//  Created by Vineet Rai on 28/02/21.
//

import Foundation
import UserNotifications

class AlarmNotification{
    
    private init(){}
    static let shared = AlarmNotification()
    
    func addAlarm(label:String,taskType:String,time:Date){
        let content = UNMutableNotificationContent()
        content.title = taskType
        content.subtitle = label
        content.sound = UNNotificationSound.default
        content.sound = UNNotificationSound.init(named:UNNotificationSoundName(rawValue: "mixkit-alarm-digital-clock-beep-989.wav"))
        let timeInterval = time.timeIntervalSinceNow
        guard timeInterval > 0 else {
            return
        }
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
