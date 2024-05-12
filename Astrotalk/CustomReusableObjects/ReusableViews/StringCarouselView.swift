//
//  StringCarouselView.swift
//  Astrotalk
//
//  Created by Mac on 05/05/2024.
//

import UIKit

class StringCarouselView: UIView, UIScrollViewDelegate {
    
    var strings: [String] = []
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    var timer: Timer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    func setSubviewsAndLayout() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: Int(frame.width), height: Int(frame.height)))
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        addSubview(scrollView)
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: frame.height - 20, width: frame.width, height: 20))
        pageControl.numberOfPages = strings.count
        addSubview(pageControl)
        
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
        }
    }
    
    func addStrings(_ strings: [String]) {
        self.strings = strings
        pageControl.numberOfPages = strings.count
        for (index, string) in strings.enumerated() {
            let label = UILabel(frame: CGRect(x: CGFloat(index) * frame.width, y: 0, width: frame.width, height: frame.height))
            label.text = string
            scrollView.addSubview(label)
        }
        scrollView.contentSize = CGSize(width: CGFloat(strings.count) * frame.width, height: frame.height)
    }
    
//    func scrollToNextString() {
//        let currentIndex = Int(scrollView.contentOffset.x / frame.width)
//        let nextIndex = (currentIndex + 1) % strings.count
//        scrollView.setContentOffset(CGPoint(x: CGFloat(nextIndex) * frame.width, y: 0), animated: true)
//        pageControl.currentPage = nextIndex
//    }
    
    func configureScrollView() {
        scrollView.frame = bounds
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: bounds.width * CGFloat(strings.count), height: 100)
        
        for (_, string) in strings.enumerated() {
            strings = ["Will my ex come back?", "When will i find my true love", "When will i get married?", "Will i get a job in abroad", "Will I have love or arranged marriage?"]
            strings.append(string)
        }
        addSubview(scrollView)
    }
    
    func configurePageControl() {
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 10)
        addSubview(pageControl)
    }
    
    //MARK: - This action when tapped shows each page control.
    func pageControlSelectedAction() {
        let action = UIAction { [weak self] _ in
            self?.pageControlTapped(self!.pageControl)
        }
        pageControl.addAction(action, for: .primaryActionTriggered)
    }
    
    //MARK: - function that shows each page control
    func pageControlTapped(_ sender: UIPageControl) {
        let currentPage = pageControl.currentPage
        let xOffset = bounds.width * CGFloat(currentPage)
        scrollView.setContentOffset(CGPoint(x: xOffset, y: 50), animated: false)
    }
    
    //MARK: - Scrollview Protocol Methods for scrolling the page control
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / bounds.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
