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
    
    override func viewDidAppear(_ animated: Bool) {
        if SegueHelper.takeToReport {
            performSegue(withIdentifier: "undwindSegueToHomeVC", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func youtubeButton(_ sender: Any) {
        // url to YouTube channel will go here
        let url = NSURL(string: "")! as URL
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
