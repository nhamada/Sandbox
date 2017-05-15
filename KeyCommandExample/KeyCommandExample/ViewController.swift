//
//  ViewController.swift
//  KeyCommandExample
//
//  Created by Naohiro Hamada on 2017/05/12.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var appeared: Bool = false
    
    override var keyCommands: [UIKeyCommand]? {
        return [UIKeyCommand.init(input: UIKeyInputEscape, modifierFlags: [], action: #selector(onClose), discoverabilityTitle: "Close!!")]
    }
    
    override var canBecomeFirstResponder: Bool {
        return appeared
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appeared = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        appeared = false
    }

    @objc private func onClose() {
        NSLog("\(#function)")
    }
}
