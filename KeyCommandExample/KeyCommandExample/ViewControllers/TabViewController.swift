//
//  TabViewController.swift
//  KeyCommandExample
//
//  Created by Naohiro Hamada on 2017/05/12.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    override var keyCommands: [UIKeyCommand]? {
        guard let viewControllers = viewControllers else {
            fatalError()
        }
        return viewControllers.enumerated().map {
            UIKeyCommand(input: "\($0.offset)",
                modifierFlags: [.command],
                action: #selector(onFired(command:)),
                discoverabilityTitle: "View Controller !")
        }
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
    
    @objc private func onFired(command: UIKeyCommand) {
        guard let index = keyCommands?.index(of: command) else {
            fatalError()
        }
        self.selectedIndex = index
    }
}
