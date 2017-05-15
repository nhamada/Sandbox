//
//  BaseNavigationController.swift
//  KeyCommandExample
//
//  Created by Naohiro Hamada on 2017/05/16.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override var keyCommands: [UIKeyCommand]? {
        return [UIKeyCommand.init(input: UIKeyInputLeftArrow, modifierFlags: [], action: #selector(onBack), discoverabilityTitle: "Back")]
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @objc private func onBack() {
        popViewController(animated: true)
    }
    
}
