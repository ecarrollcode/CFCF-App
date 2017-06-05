//
//  ReportViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/21/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit
import Foundation

class ReportViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var callOrUrlButton: UIButton!
    
    //MARK: Variables
    var urlString = String()  // to be filled with hotline url
    var isCalifornia = Bool() // used to determine if California is selected
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initial dial number + selection set for California
        isCalifornia = true
        callOrUrlButton.setTitle("Select a county", for: [.normal])
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
            callOrUrlButton.setTitle("Select a county", for: [.normal])
            isCalifornia = true // used to trigger segue in callOrUrlButton action
        } else if (phoneDictValue != nil) {
            callOrUrlButton.setTitle(phoneDictValue, for: [.normal])
            urlString.removeAll()
        } else if (webDictValue != nil) {
            callOrUrlButton.setTitle("See hotline list", for: [.normal])
            urlString = webDictValue!
        }
    }
    
    @IBAction func callOrUrlButton(_ sender: Any) {
        if isCalifornia {
            self.performSegue(withIdentifier: "reportCaliSegue", sender: nil)
            return
        }
        
        // removes special characters from string
        let charSet = CharacterSet(charactersIn: "1234567890").inverted
        let unformatted = callOrUrlButton.currentTitle
        let cleanedString = unformatted!.components(separatedBy: charSet).joined(separator: "")
        
        // create and configure alert controller
        let alertController = UIAlertController(title: unformatted, message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let callAction = UIAlertAction(title: "Call", style: .default) { (action) in
            let number = NSURL(string: "tel://" + cleanedString)! as URL
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(number, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(number)
            }
    
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(callAction)
        
        if urlString.isEmpty {
            self.present(alertController, animated: true, completion: nil)
        } else {
            let url = NSURL(string: urlString)! as URL
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
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
