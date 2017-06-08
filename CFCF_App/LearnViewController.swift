//
//  LearnViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/21/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {
    
    @IBOutlet weak var youtubeButton: UIButton!
    /* Training and Guide buttons will probably lead to other screens,
      thus no need for IBOutlets/Actions */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
                self.performSegue(withIdentifier: "undwindSegueToHomeVC", sender: nil)
                return
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func youtubeButton(_ sender: Any) {
        let url = NSURL(string: "https://www.youtube.com/watch?v=HVRlOiC1uss&list=PLf3DiW4XOaaYSDATIc4tu7aSSfdbd8sej")! as URL
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func unwindToLearnVC(segue: UIStoryboardSegue) {}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
