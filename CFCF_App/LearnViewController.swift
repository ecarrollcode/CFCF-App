//
//  LearnViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/21/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {
    
    @IBOutlet weak var cfcfButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    @IBOutlet weak var trainingBtn: UIButton!
    @IBOutlet weak var guideBtn: UIButton!
    
    @IBOutlet weak var iPadYouTubeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch UIDevice().type {
            case .iPhone5, .iPhone5S, .iPhone5C:
                self.youtubeButton.titleLabel!.font = self.youtubeButton.titleLabel!.font.withSize(13)
                self.trainingBtn.titleLabel!.font = self.trainingBtn.titleLabel!.font.withSize(13)
                self.guideBtn.titleLabel!.font = self.guideBtn.titleLabel!.font.withSize(13)
                break
            default: break
        }
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
