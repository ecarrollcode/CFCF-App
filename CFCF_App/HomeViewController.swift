//
//  ViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/21/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if SegueHelper.takeToReport {
            performSegue(withIdentifier: "toReportSegue", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHomeVC(segue: UIStoryboardSegue) {}
}

class SegueHelper {
    static var sharedInstance = SegueHelper() // This is singleton
    
    static var takeToReport = false
    
    private init() { }
}

