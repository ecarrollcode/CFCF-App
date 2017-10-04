//
//  ViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/21/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit
import Darwin

class HomeViewController: UIViewController {

    @IBOutlet weak var learnBtn: UIButton!
    @IBOutlet weak var cfcfButton: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var reportBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch UIDevice().type {
            case .simulator, .iPad2, .iPad3, .iPad4, .iPadAir1, .iPadAir2, .iPadPro9_7, .iPadPro12_9, .iPadPro9_7_cell, .iPadPro12_9_cell:
                if !onIPad {
                    onIPad = true
                    let alertController = UIAlertController(title: "Better on the iPhone", message: "Please consider trying this app on an iPhone - we're still working on iPad support!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            default: break
        }
        
        switch UIDevice().type {
            case .iPhone5, .iPhone5S, .iPhone5C:
                self.learnBtn.titleLabel!.font = self.learnBtn.titleLabel!.font.withSize(13.5)
                self.shareBtn.titleLabel!.font = self.shareBtn.titleLabel!.font.withSize(13.5)
                self.reportBtn.titleLabel!.font = self.reportBtn.titleLabel!.font.withSize(13.5)
                break
            default: break
        }

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
        if #available(iOS 9.0, *) {} else {
            let alertController = UIAlertController(title: "Update Needed", message: "Your version of iOS must be 9.0 or higher in order to use this app. Please tap \"Update\" to be taken to the Software Update page of your device's settings.", preferredStyle: .alert)
            let quitAction = UIAlertAction(title: "Quit", style: .cancel) { (action) in
                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                let when = DispatchTime.now() + 0.5
                DispatchQueue.main.asyncAfter(deadline: when) {
                    exit(0)
                }
            }
            let updateAction = UIAlertAction(title: "Update", style: .default) { (action) in
                let url: NSURL! = NSURL(string : "prefs:root=General&path=SOFTWARE_UPDATE_LINK")
                UIApplication.shared.openURL(url as URL)
                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                let when = DispatchTime.now() + 2.0
                DispatchQueue.main.asyncAfter(deadline: when) {
                    exit(0)
                }
            }
            alertController.addAction(quitAction)
            alertController.addAction(updateAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
    
    
    @IBAction func unwindToHomeVC(segue: UIStoryboardSegue) {}
}

class SegueHelper {
    static var sharedInstance = SegueHelper() // This is singleton
    
    static var takeToReport = false
    
    private init() { }
}

