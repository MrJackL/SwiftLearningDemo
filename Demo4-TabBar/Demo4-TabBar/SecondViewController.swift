//
//  SecondViewController.swift
//  Demo4-TabBar
//
//  Created by Jack Liao on 9/29/16.
//  Copyright © 2016 MrJackL. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func showAlertBtnPressed(sender: AnyObject){
        
        let alertController = UIAlertController(title: "Alert", message: "App showed a alert", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) in
            print("Click Cancel")
        }
        alertController.addAction(cancelAction)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Destructive) { (action) in
            print("Click Confirm")
        }
        alertController.addAction(confirmAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func actionSheetBtnPressed(sender: AnyObject){
        let actionSheetController = UIAlertController(title: "ActionSheet", message: "App show an actionSheet", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Destructive) { (action) in
            print("Click Delete")

        }
        actionSheetController.addAction(deleteAction)
        
        let canCelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) in
            print("Click Cancel")
        }
        actionSheetController.addAction(canCelAction)
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
        
    }

}
