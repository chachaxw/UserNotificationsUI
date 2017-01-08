//
//  ViewController.swift
//  NotificationsUI
//
//  Created by Chacha on 08/01/17.
//  Copyright © 2017 Chacha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func datePickerDidSelectNewDate(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.scheduleNotification(at: selectedDate)
    }
    
}
