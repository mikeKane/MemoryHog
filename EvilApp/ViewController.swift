//
//  ViewController.swift
//  EvilApp
//
//  Created by Michael Kane on 5/15/18.
//  Copyright © 2018 Michael Kane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var memoryWarningLabel: UILabel!
    @IBOutlet weak var currentMBLabel: UILabel!

    var bytesArray = [UInt8]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       self.memoryWarningLabel.text = "Memory Warning"
    }

    @IBAction func plus1MB(_ sender: Any) {
        DispatchQueue.main.async {
            for _ in 0...1000000  {
                self.bytesArray.append(0)
            }
            self.updateLabel()
        }
    }
    
    @IBAction func plus10MB(_ sender: Any) {
        DispatchQueue.main.async {
            for _ in 0...10000000 {
                self.bytesArray.append(0)
            }
            self.updateLabel()
        }
    }
    
    @IBAction func plus100MB(_ sender: Any) {
        for _ in 0...100000000 {
            self.bytesArray.append(0)
        }
        self.updateLabel()
    }
    
    @IBAction func minus1Mb(_ sender: Any) {
        
        if self.bytesArray.count > 1000000 {
            self.bytesArray.removeSubrange(0...1000000)
        }
         self.updateLabel()
    }
    
    @IBAction func minus10MB(_ sender: Any) {
        if self.bytesArray.count > 10000000 {
            self.bytesArray.removeSubrange(0...10000000)
        }
         self.updateLabel()
    }
    
    @IBAction func minus100MB(_ sender: Any) {
        if self.bytesArray.count > 100000000 {
            self.bytesArray.removeSubrange(0...100000000)
        }
         self.updateLabel()
    }
    
    func updateLabel() {
        self.currentMBLabel.text = "+ \(bytesArray.count / 1000000)MB in use"
    }
}
