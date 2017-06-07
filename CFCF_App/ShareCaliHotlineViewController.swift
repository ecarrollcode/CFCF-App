//
//  ShareCaliHotlineViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/21/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

class ShareCaliHotlineViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var countyPicker: UIPickerView!
    @IBOutlet weak var sendHotline: UIButton!
    
    //MARK: Variables
    // intialize empty string to be filled with numbers
    var messageText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageText = "Call this number to report child abuse in Los Angeles county: " + HotlineData.countyDict["Los Angeles"]!
        sendHotline.setTitle("Send hotline number", for: [.normal])
        countyPicker.selectRow(18, inComponent: 0, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Picker Functions
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return HotlineData.countyNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return HotlineData.countyNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let itemSelected = HotlineData.countyNames[row]
        let countyDictValue = HotlineData.countyDict[itemSelected]
        
        sendHotline.setTitle("Send hotline number", for: [.normal])
        messageText = "Call this number to report child abuse in " + itemSelected +
            " county: " + countyDictValue!
    }
    
    //MARK: Actions
    @IBAction func sendHotline(_ sender: Any) {
        if MFMessageComposeViewController.canSendText() == false {
            print("Cannot send text")
            return
        }
        
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = messageText;
        messageVC.recipients = [" "];
        messageVC.messageComposeDelegate = self;
        
        self.present(messageVC, animated: false, completion: nil)
    }
    
    //MARK: SMS Message Functions
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
