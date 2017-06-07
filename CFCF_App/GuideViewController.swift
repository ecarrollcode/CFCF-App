//
//  GuideViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/31/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit


class GuideViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var restOfWelcomeLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var actionBtn1: UIButton!
    @IBOutlet weak var actionBtn2: UIButton!
    
    var questionNum = Int()
    var takeToLearnOrContinue = Bool()
    var takeToReport = Bool()
    
    typealias MethodHandler = ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionNum = 0
        takeToLearnOrContinue = false
        takeToReport = false
        
        welcomeLabel.alpha = 0
        restOfWelcomeLabel.alpha = 0
        descriptionLabel.alpha = 0
        questionLabel.alpha = 0
        actionBtn1.alpha = 0
        actionBtn2.alpha = 0
        actionBtn2.setTitle("Continue", for: .normal)
        descriptionConstraint.constant -= view.bounds.width
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5, delay: 0.2, options: .curveLinear, animations: {
            self.welcomeLabel.alpha = 1
        }, completion: { (finished: Bool) in
            UIView.animate(withDuration: 1.5, delay: 0, options: .curveLinear, animations: {
                self.restOfWelcomeLabel.alpha = 1
            }, completion: { (finished: Bool) in
                UIView.animate(withDuration: 1.3, delay: 0.6, options: .curveEaseOut, animations: {
                self.descriptionConstraint.constant += self.view.bounds.width
                self.descriptionLabel.alpha = 1
                self.view.layoutIfNeeded()
                }, completion: { (finished: Bool) in
                    UIView.animate(withDuration: 1, delay: 0.5, options: .curveLinear, animations: {
                        self.actionBtn2.alpha = 1
                    }, completion: nil)
                })
            })
        })
    }
    
    // closure argument is an optional function that can be passed in as an argument
    func fadeIn(btn1Text: String, btn2Text: String, questionLabelText: String) {
        self.questionLabel.text = questionLabelText
        UIView.animate(withDuration: 1.5, delay: 0.7, options: .curveLinear, animations: {
            self.questionLabel.alpha = 1
        }, completion: { (finished: Bool) in
            self.actionBtn1.setTitle(btn1Text, for: .normal)
            self.actionBtn2.setTitle(btn2Text, for: .normal)
            UIView.animate(withDuration: 1.5, delay: 0.7, options: .curveLinear, animations: {
                self.actionBtn1.alpha = 1
                self.actionBtn2.alpha = 1
            }, completion: nil)
        })
    }
    
    func fadeOut(btn1Text: String, btn2Text: String, questionLabelText: String,
                 doFadeIn: Bool? = false, labelTextSize: CGFloat? = nil, btnToHide: UIButton? = nil, transition: String? = nil) {
        UIView.animate(withDuration: 1.5, delay: 0.7, options: .curveLinear, animations: {
            self.questionLabel.alpha = 0
            self.actionBtn1.alpha = 0
            self.actionBtn2.alpha = 0
        }, completion: { (finished: Bool) in
            
            if btnToHide != nil {
                btnToHide!.isHidden = true
            }
            
            if labelTextSize != nil {
                self.questionLabel.font = self.questionLabel.font.withSize(labelTextSize!)
            }
            
            if doFadeIn! {
                self.fadeIn(btn1Text: btn1Text, btn2Text: btn2Text, questionLabelText: questionLabelText)
            }
            
            if transition != nil {
                if transition == "report" {
                    SegueHelper.takeToReport = true
                }
                self.performSegue(withIdentifier: "unwindSegueToLearnVC", sender: nil)
                self.viewDidLoad() // refresh the view
                return
            }
        })
    }
    
    func fadeOutAndBackIn(btn1Text: String, btn2Text: String, questionLabelText: String,
                          labelTextSize: CGFloat? = nil, btnToHide: UIButton? = nil) {
        // ensures that fadeOut is not called until fadeIn is finished
        self.fadeOut(btn1Text: btn1Text, btn2Text: btn2Text, questionLabelText: questionLabelText,
                     doFadeIn: true, labelTextSize: labelTextSize, btnToHide: btnToHide)
    }

    @IBAction func actionBtn2(_ sender: Any) {
        if takeToLearnOrContinue {
            fadeOut(btn1Text: "", btn2Text: "", questionLabelText: "", transition: "learn")
        } else if takeToReport {
            fadeOut(btn1Text: "", btn2Text: "", questionLabelText: "", transition: "report")
        } else {
            if questionNum == 3 || questionNum == 4 {
                takeToReport = true
                let questionNumText = "Please collect the names and phone numbers or other contact details of persons you know of who may have more information.  " +
                "When you are ready, click below to look up the relevant hotline under Report."
                self.fadeOutAndBackIn(btn1Text: "", btn2Text: "Continue", questionLabelText: questionNumText, labelTextSize: 17.0, btnToHide: self.actionBtn1)
            }
            
            if questionNum == 2 {
                questionNum = 4
                let question4Text = "Do you know this one child's name and an address where the child lives or attends school or day care?"
                self.fadeOutAndBackIn(btn1Text: "Yes", btn2Text: "No", questionLabelText: question4Text, labelTextSize: 20.0)
            }
            
            if questionNum == 1 {
                takeToLearnOrContinue = true
                let learnText = "It sounds like you are just generally looking to learn about child abuse. Tap Learn below to visit some of our resources. " +
                "Tap Continue if you would like to go through this interview as a simulation of a real-world concern."
                self.fadeOutAndBackIn(btn1Text: "Continue", btn2Text: "Learn", questionLabelText: learnText, labelTextSize: 17.0)
            }
            
            
            if questionNum == 0 {
                questionNum = 1
                let question1Text = "Are you using this guide because you have specific concerns about a specific child?"
                UIView.animate(withDuration: 1.5, delay: 0, options: .curveLinear, animations: {
                    self.welcomeLabel.alpha = 0
                    self.restOfWelcomeLabel.alpha = 0
                    self.actionBtn2.alpha = 0
                    self.descriptionLabel.alpha = 0
                }, completion: { (finished: Bool) in
                    self.fadeIn(btn1Text: "Yes", btn2Text: "No", questionLabelText: question1Text)
                })
            }
        }
    }
    
    @IBAction func actionBtn1(_ sender: Any) {
        if questionNum == 1 {
            takeToLearnOrContinue = false
            questionNum = 2
            let question2Text = "Are you concerned about more than one child?"
            self.fadeOutAndBackIn(btn1Text: "Yes", btn2Text: "No", questionLabelText: question2Text, labelTextSize: 22.0)
        } else if questionNum == 2 {
            questionNum = 3
            let question3Text = "Do you know where any of these children is now? Or do you know where any of these children lives or goes to daycare?"
            self.fadeOutAndBackIn(btn1Text: "Yes", btn2Text: "No", questionLabelText: question3Text, labelTextSize: 20.0)
        } else if questionNum == 3 || questionNum == 4 {
            takeToReport = true
            let reportText = "The situation you describe, with children at risk, requires prompt if not immediate reporting of your concerns. Tap below to lookup the appropriate hotline number."
            self.fadeOutAndBackIn(btn1Text: "", btn2Text: "Report", questionLabelText: reportText, labelTextSize: 17.0, btnToHide: self.actionBtn1)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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