//
//  TrainingViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/24/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var iPadTrainingScrollView: UIScrollView!
    @IBOutlet weak var trainingScrollView: UIScrollView!
    
    var currentScrollView: UIScrollView = UIScrollView()
    var slidesCount = 0
    
    var isIPhone = true
    var resizeForFive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch UIDevice().type {
            case .simulator, .iPadAir2, .iPadPro9_7, .iPadPro9_7_cell, .iPadPro12_9, .iPadPro12_9_cell:
                isIPhone = false
            case .iPhone5, .iPhone5C, .iPhone5S:
                resizeForFive = true
            default: break
        }
        
        if isIPhone {
            currentScrollView = trainingScrollView
        } else {
            currentScrollView = iPadTrainingScrollView
        }
        
        currentScrollView.delegate = self
        currentScrollView.showsHorizontalScrollIndicator = false
        currentScrollView.showsVerticalScrollIndicator = false
        let slides: [Slide] = createSlides()
        setupSlideScrollView(slides: slides)
    }
    
    func createSlides() -> [Slide] {
        
        var slides: [Slide] = []
        let slideArrOfDicts = Slide.getArrOfDicts()

        for dict in slideArrOfDicts {
            if isIPhone {
                let slide: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                slide.header.text = dict["header"]!
                slide.content.text = dict["content"]!
                slides.append(slide)
                if resizeForFive {
                    slide.header.font = slide.header.font.withSize(21)
                    slide.content.font = slide.content.font.withSize(13)
                    slide.slideNumLabel.font = slide.slideNumLabel.font.withSize(13)
                }
            } else {
                let slide: Slide = Bundle.main.loadNibNamed("iPadSlide", owner: self, options: nil)?.first as! Slide
                slide.iPadHeader.text = dict["header"]!
                slide.iPadContent.text = dict["content"]!
                slides.append(slide)
            }
        }
        
        return slides
    }
    
    func setupSlideScrollView(slides: [Slide]) {
        currentScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        currentScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        
        slidesCount = slides.count
        
        var slideLabel: UILabel = UILabel()
        
        for i in 0 ..< slidesCount {
            if isIPhone {
                slideLabel = slides[i].slideNumLabel
            } else {
                slideLabel = slides[i].iPadSlideNumLabel
            }
            slideLabel.text = String(i + 1) + "/" + String(slidesCount)
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            currentScrollView.addSubview(slides[i])
        }
    }
    
//    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
//        currentScrollView.setContentOffset(currentScrollView.contentOffset, animated: true)
//    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentScrollView.contentOffset.y = -60.0
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
