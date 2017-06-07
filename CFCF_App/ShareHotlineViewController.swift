//
//  ShareHotlineViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/21/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

class ShareHotlineViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var sendHotline: UIButton!
    
    //MARK: Variables
    // initialize variable to determine if California is selected
    var isCalifornia = Bool()
    
    // intialize empty string to be filled with url
    var numOrUrlString = String()
    var messageText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageText.removeAll()
        // set picker deafault to California configurations
        isCalifornia = true
        sendHotline.setTitle("Select a county", for: [.normal])
        statePicker.selectRow(4, inComponent: 0, animated: true)
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
        return HotlineData.stateNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return HotlineData.stateNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let itemSelected = HotlineData.stateNames[row]
        let phoneDictValue = HotlineData.stateInfosPhoneDict[itemSelected]
        let webDictValue = HotlineData.stateInfosWebDict[itemSelected]
        
        isCalifornia = false // assume California is not selected
        if (itemSelected == "California") {
            sendHotline.setTitle("Select a county", for: [.normal])
            isCalifornia = true // used to trigger segue in sendHotline action
        } else if (phoneDictValue != nil) {
            // accounts for special cases of DC and Puerto Rico
            if (itemSelected == "District of Columbia") {
                messageText = "Call this number to report child abuse in the " + itemSelected + ": " + phoneDictValue!;
                sendHotline.setTitle("Send hotline number", for: [.normal])
            } else if (itemSelected == "Puerto Rico") {
                messageText = "Call this number to report child abuse in " + itemSelected + ": " + phoneDictValue!;
                sendHotline.setTitle("Send hotline number", for: [.normal])
            } else {
                messageText = "Call this number to report child abuse in the state of " + itemSelected + ": " + phoneDictValue!;
                sendHotline.setTitle("Send hotline number", for: [.normal])
            }
        } else if (webDictValue != nil) {
            messageText = "Follow this link for a list of hotlines to report child abuse in the state of " + itemSelected + ": " + webDictValue!;
            sendHotline.setTitle("Send hotline list", for: [.normal])
        }
    }
    
    @IBAction func sendHotline(_ sender: Any) {
        if isCalifornia {
            self.performSegue(withIdentifier: "toShareCaliSegue", sender: nil)
            return
        }
        
        if MFMessageComposeViewController.canSendText() == false {
            print("Cannot send text")
            return
        }
        
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = messageText
        messageVC.recipients = [" "]
        messageVC.messageComposeDelegate = self
        
        self.present(messageVC, animated: false, completion: nil)
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
