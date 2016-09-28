//
//  ViewController.swift
//  StopWatch
//
//  Created by Jack Liao on 9/28/16.
//  Copyright © 2016 MrJackL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTime: UILabel?
    @IBOutlet weak var btnReset: UIButton?
    @IBOutlet weak var btnPause: UIButton?
    @IBOutlet weak var btnPlay: UIButton?
    
    var watchTimer = NSTimer()
    var count = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnPause?.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func resetBtnPressed(sender: AnyObject){
        
        count = 0.0
        btnPause?.enabled = false
        btnPlay?.enabled = true
        watchTimer.invalidate()
        labelTime?.text = String(format: "%.1f",count)
        
    }
    
    @IBAction func pauseBtnPressed(sender: AnyObject){
        btnPause?.enabled = false
        btnPlay?.enabled = true
        watchTimer.invalidate()
    }
    
    @IBAction func playBtnPressed(sender: AnyObject){
        btnPlay?.enabled = false
        btnPause?.enabled = true
        watchTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    func updateTimer()  {
        count += 0.1
        labelTime?.text = String(format: "%.1f",count)
    }
    
}

