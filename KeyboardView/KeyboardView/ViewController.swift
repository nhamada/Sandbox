//
//  ViewController.swift
//  KeyboardView
//
//  Created by Naohiro Hamada on 2017/05/25.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textView.layer.cornerRadius = 4
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(onKeyboardWillShow(notification:)),
                                       name: Notification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(onKeyboardDidShow(notification:)),
                                       name: Notification.Name.UIKeyboardDidShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(onKeyboardWillHide(notification:)),
                                       name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(onKeyboardDidHide(notification:)),
                                       name: Notification.Name.UIKeyboardDidHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(onKeyboardWillChangeFrame(notification:)),
                                       name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        notificationCenter.addObserver(self, selector: #selector(onKeyboardDidChangeFrame(notification:)),
                                       name: Notification.Name.UIKeyboardDidChangeFrame, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.removeObserver(self, name: Notification.Name.UIKeyboardDidShow, object: nil)
        notificationCenter.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.removeObserver(self, name: Notification.Name.UIKeyboardDidHide, object: nil)
        notificationCenter.removeObserver(self, name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        notificationCenter.removeObserver(self, name: Notification.Name.UIKeyboardDidChangeFrame, object: nil)
    }

    // MARK:- Keyboard notifications
    @objc private func onKeyboardWillShow(notification: Notification) {
        log(notification: notification)
    }
    
    @objc private func onKeyboardDidShow(notification: Notification) {
        log(notification: notification)
    }
    
    @objc private func onKeyboardWillHide(notification: Notification) {
        log(notification: notification)
    }
    
    @objc private func onKeyboardDidHide(notification: Notification) {
        log(notification: notification)
    }
    
    @objc private func onKeyboardWillChangeFrame(notification: Notification) {
        log(notification: notification)
    }
    
    @objc private func onKeyboardDidChangeFrame(notification: Notification) {
        log(notification: notification)
    }
    
    // MARK:- Private methods
    private func log(notification: Notification, function: String = #function) {
        print("----------")
        print("\(function)")
        print("\tnotification.name = \(notification.name)")
        guard let userInfo = notification.userInfo else {
            return
        }
        print("\tnotification.userInfo =")
        for (k, v) in userInfo {
            print("\t\t\(k)=\(v)")
        }
    }
}
