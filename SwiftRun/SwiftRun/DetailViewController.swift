//
//  DetailViewController.swift
//  SwiftRun
//
//  Created by Mike Henry on 1/28/16.
//  Copyright © 2016 Mike Henry. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    var dataManager = DataManager.sharedInstance
    @IBOutlet weak var runDatePicker :UIDatePicker!
    @IBOutlet weak var runDistanceTextField :UITextField!
    @IBOutlet weak var runTimeTextField :UITextField!
    var runEntry :PFObject?
    
    
    //MARK: - Add Run Methods
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        print("Save button pressed")
        runEntry = PFObject(className: "Runs")
        runEntry!["dateRan"] = NSDate()
        runEntry!["distance"] = Double(runDistanceTextField.text!)
        runEntry!["time"] = Double(runTimeTextField.text!)
        
        runEntry?.saveInBackground()
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    //MARK: Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
