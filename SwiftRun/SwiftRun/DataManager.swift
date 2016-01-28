//
//  DataManager.swift
//  SwiftRun
//
//  Created by Mike Henry on 1/28/16.
//  Copyright © 2016 Mike Henry. All rights reserved.
//

import UIKit
import Parse

class DataManager: NSObject {
    
    //MARK: - Properties
    static let sharedInstance = DataManager()
    var runsDataArray = [PFObject]()
    
    
    //MARK: - Parse Fetch Method
    
    func fetchDataFromParse() {
        let fetchRuns = PFQuery(className: "Runs")
        fetchRuns.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                print("Got Runs Data")
                self.runsDataArray = objects!
                print("Data Array: \(self.runsDataArray)")
                dispatch_async(dispatch_get_main_queue()) {
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "receivedRunsDataFromServer", object: nil))
                }
            } else {
                print("No Runs Data")
            }
        }
        
    }

}
