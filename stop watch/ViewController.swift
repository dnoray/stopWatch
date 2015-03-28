//
//  ViewController.swift
//  stop watch
//
//  Created by Don Noray on 3/26/15.
//  Copyright (c) 2015 Don Noray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeDisplayLabel: UILabel!
    
    var toolbar: UIToolbar!
    var timer = NSTimer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myToolbar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // bounds is now correctly set
        toolbar.frame = CGRectMake(0, view.bounds.height-44, view.bounds.width, 44)
    }
    
    func myToolbar() {
        
        toolbar = UIToolbar()
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Stop, target: self, action: "stopAction:"),
            UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "playAction:")
        ]
        
        self.view.addSubview(toolbar)
    }
    
    func playAction(sender: UIBarButtonItem) {
        
        if !timer.valid {
            
            // If the timer is not running
            // Start the timer
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
            //set the icon to Pause
            self.navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "playAction:"), animated: true)
            
            
        } else {
            
            //pause the timer
            timer.invalidate()
            //set the icon to Play
            self.navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "playAction:"), animated: true)
            
        }
        
    }
    
    
    func stopAction(sender: UIBarButtonItem) {
        
        timer.invalidate()
        counter = 0
        timeDisplayLabel.text = "0"
    }
    
    func updateTime() {
        counter++
        timeDisplayLabel.text = String(counter)
    }


}

