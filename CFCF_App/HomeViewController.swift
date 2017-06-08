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
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.isUserInteractionEnabled = true
        if SegueHelper.takeToReport {
            // temporarily disable user interaction
            self.view.isUserInteractionEnabled = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if SegueHelper.takeToReport {
            // delay segue by a second
            let when = DispatchTime.now() + 0.25
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.performSegue(withIdentifier: "toReportSegue", sender: nil)
                return
            }
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

