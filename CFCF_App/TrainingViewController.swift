//
//  TrainingViewController.swift
//  CFCF_App
//
//  Created by Ed Carroll on 5/24/17.
//  Copyright © 2017 Ed Carroll. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var trainingScrollView: UIScrollView!
    
    var imageArray = [UIImage]()
    var slidesCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trainingScrollView.delegate = self
        trainingScrollView.showsHorizontalScrollIndicator = false
        trainingScrollView.showsVerticalScrollIndicator = false
        let slides: [Slide] = createSlides()
        setupSlideScrollView(slides: slides)
    }
    
    func createSlides() -> [Slide] {
        
        var slides: [Slide] = []
        let slideArrOfDicts = Slide.getArrOfDicts()
        
        for dict in slideArrOfDicts {
            let slide: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide.header.text = dict["header"]!
            slide.content.text = dict["content"]!
            slides.append(slide)
        }
        
        return slides
    }
    
    func setupSlideScrollView(slides: [Slide]) {
        trainingScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        trainingScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        
        slidesCount = slides.count
        
        for i in 0 ..< slidesCount {
            slides[i].slideNumLabel.text = String(i + 1) + "/" + String(slidesCount)
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            trainingScrollView.addSubview(slides[i])
        }
    }
    
//    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
//        trainingScrollView.setContentOffset(trainingScrollView.contentOffset, animated: true)
//    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        trainingScrollView.contentOffset.y = -60.0
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
