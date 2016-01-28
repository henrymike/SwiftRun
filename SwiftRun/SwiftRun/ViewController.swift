//
//  ViewController.swift
//  SwiftRun
//
//  Created by Mike Henry on 1/28/16.
//  Copyright © 2016 Mike Henry. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Properties
    var dataManager = DataManager.sharedInstance
    @IBOutlet weak var runsTableView :UITableView!

    
    //MARK: - Table View Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.runsDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let runCell = tableView.dequeueReusableCellWithIdentifier("runCell", forIndexPath: indexPath) as UITableViewCell
        let currentRun = dataManager.runsDataArray[indexPath.row]
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.systemTimeZone()
        dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm a"
        runCell.textLabel!.text = String(dateFormatter.stringFromDate(currentRun["dateRan"] as! NSDate))
        
        let runPace = ((currentRun["time"] as! Double) / 60) / (currentRun["distance"] as! Double)
        print(runPace)
        let runDistance = currentRun["distance"]
        let runTime = (currentRun["time"] as! Double) / 60
        runCell.detailTextLabel!.text = String(format: "Time: %.2f", runTime) + " • " + String(format: "Pace: %.2f", runPace) + " • " + "Distance: \(runDistance) miles"
        
        
        return runCell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let runToDelete = dataManager.runsDataArray[indexPath.row]
            runToDelete.deleteInBackground()
            dataManager.fetchDataFromParse()
        }
    }
    
    func newRunsDataReceived() {
        runsTableView.reloadData()
    }
    
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.fetchDataFromParse()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "newRunsDataReceived", name: "receivedRunsDataFromServer", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        dataManager.fetchDataFromParse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

