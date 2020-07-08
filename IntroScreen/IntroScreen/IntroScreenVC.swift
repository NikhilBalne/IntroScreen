//
//  IntroScreenVC.swift
//  IntroScreen
//
//  Created by Nikhil Balne on 08/07/20.
//  Copyright © 2020 Nikhil Balne. All rights reserved.
//

import UIKit

class IntroScreenVC: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var slides:[Slide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
           
           scrollView.contentInsetAdjustmentBehavior = .never
           
           slides = createSlides()
           setupSlideScrollView(slides: slides)
           
           pageControl.numberOfPages = slides.count
           pageControl.currentPage = 0
           view.bringSubviewToFront(pageControl)
       }
       
       func createSlides() -> [Slide] {
           
           let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
           slide1.slidingBackgroundImage.image = UIImage(named: "IntroBackGround")
           slide1.slidingTopImage.image = UIImage(named: "IntroOne")
           slide1.titleLabel.text = "Single Dashboard"
           slide1.subTitleLabel.text = "to manage all practices"
           
           let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
           slide2.slidingBackgroundImage.image = UIImage(named: "IntroBackGround")
           slide2.slidingTopImage.image = UIImage(named: "IntroTwo")
           slide2.titleLabel.text = "Al Powered"
           slide2.subTitleLabel.text = "queue management"
           
           let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
           slide3.slidingBackgroundImage.image = UIImage(named: "IntroBackGround")
           slide3.slidingTopImage.image = UIImage(named: "IntroThree")
           slide3.titleLabel.text = "Know"
           slide3.subTitleLabel.text = "your patients better"
           
           return [slide1, slide2, slide3]
       }
       
       func setupSlideScrollView(slides : [Slide]) {
           scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
           scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
           scrollView.isPagingEnabled = true
           
           for i in 0 ..< slides.count {
               slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
               scrollView.addSubview(slides[i])
           }
       }
       
       func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
           let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
           pageControl.currentPage = Int(pageIndex)
        
           if pageControl.currentPage == 0 {
               nextButton.setTitle("Next", for: UIControl.State.normal)
           }else if pageControl.currentPage == 1 {
               nextButton.setTitle("Next", for: UIControl.State.normal)
           }else if pageControl.currentPage == 2 {
            
               nextButton.setTitle("Get Started", for: UIControl.State.normal)
           }
           
       }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        let pageNumber = pageControl.currentPage + 1
    
                var frame = scrollView.frame
                //If your scroll is horizonal
                frame.origin.x = frame.size.width * CGFloat(pageNumber)
                frame.origin.y = 0
                scrollView.scrollRectToVisible(frame, animated: true)
                
                if pageNumber == 0 {
                    
                    let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                    slide1.slidingTopImage.image = UIImage(named: "IntroOne")
                    slide1.titleLabel.text = "Single Dashboard"
                    slide1.subTitleLabel.text = "to manage all practices"
                    nextButton.setTitle("Next", for: .normal)
                    
                } else if pageNumber == 1 {
                    
                    let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                    slide2.slidingTopImage.image = UIImage(named: "IntroTwo")
                    slide2.titleLabel.text = "Al Powered"
                    slide2.subTitleLabel.text = "queue management"
                    nextButton.setTitle("Next", for: .normal)
                    
                } else if pageNumber == 2 {
                    
                    let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                    slide3.slidingTopImage.image = UIImage(named: "IntroThree")
                    slide3.titleLabel.text = "Know"
                    slide3.subTitleLabel.text = "your patients better"
                    nextButton.setTitle("Get Started", for: .normal)
                    
                }else {
                    
        //            let navigation = self.storyboard?.instantiateViewController(withIdentifier: "LoginScreenVC") as! LoginScreenVC
        //
        //            UserDefaults.standard.set("AlreadyEntered", forKey: "IntroScreen")
        //            UserDefaults.standard.synchronize()
        //
        //            self.navigationController?.pushViewController(navigation, animated: true)
                }
        
    }
    
}
