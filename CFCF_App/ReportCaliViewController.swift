//
//  ReportCaliViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/21/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

class ReportCaliViewController: UIViewController {

    //MARK: Actions
    @IBOutlet weak var countyPicker: UIPickerView!
    @IBOutlet weak var callButton: UIButton!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial dial number + selection set for Los Angeles county
        callButton.setTitle(HotlineData.countyDict["Los Angeles"], for: [.normal])
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
        let countyDictValue = HotlineData.countyDict[itemSelected]!
        
        callButton.setTitle(countyDictValue, for: [.normal])
    }
    
    @IBAction func callButton(_ sender: Any) {
        // removes special characters from string
        let charSet = CharacterSet(charactersIn: "1234567890").inverted
        let unformatted = callButton.currentTitle
        let cleanedString = unformatted!.components(separatedBy: charSet).joined(separator: "")
        let number = URL(string: "tel://" + cleanedString)

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number!)
        } else {
            UIApplication.shared.openURL(number!)
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
