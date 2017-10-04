//
//  ShareViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/21/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

class ShareViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var shareApp: UIButton!
    @IBOutlet weak var shareHotline: UIButton!
    
    @IBAction func shareApp(_ sender: Any) {
        if MFMessageComposeViewController.canSendText() == false {
            print("Cannot send text")
            return
        }
        
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = "Help stop child abuse. " +
                         "Learn more by downloading this app from the Corina Field Carroll Fund: " +
                         "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=1245542351&mt=8";
        messageVC.recipients = [" "];
        messageVC.messageComposeDelegate = self;
        
        self.present(messageVC, animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch UIDevice().type {
            case .iPhone5, .iPhone5S, .iPhone5C:
                self.shareHotline.titleLabel!.font = self.shareHotline.titleLabel!.font.withSize(17)
                self.shareApp.titleLabel!.font = self.shareApp.titleLabel!.font.withSize(17)
            default: break
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            self.dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            self.dismiss(animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
