//
//  ViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/21/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var cfcfButton: UIButton!
    
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
    
    @IBAction func cfcfButton(_ sender: Any) {
        let alertController = UIAlertController(title: "About CFCF", message: "The CFCF is a 501(c)(3) exempt organization and Tennessee registered non-profit, whose mission is to advance the protection of children. Click OK to continue to our website.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let callAction = UIAlertAction(title: "OK", style: .default) { (action) in
            let cfcfUrl = URL(string: "http://www.corinafieldcarrollfund.com/")
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(cfcfUrl!, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(cfcfUrl!)
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(callAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func unwindToHomeVC(segue: UIStoryboardSegue) {}
}

class SegueHelper {
    static var sharedInstance = SegueHelper() // This is singleton
    
    static var takeToReport = false
    
    private init() { }
}

