//
//  ViewController.swift
//  pagingColor
//
//  Created by Hyowon Choi on 2018. 4. 4..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<5 {
            let subView = UIView()
            subView.frame = UIScreen.main.bounds
            subView.backgroundColor = UIColor(
                red: CGFloat(index * 50) / 255.0,
                green: CGFloat(index * 50) / 255.0,
                blue: CGFloat(index * 50) / 255.0,
                alpha: 1
            )
            subView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
            scrollView.addSubview(subView)
        }
        
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(
            width: UIScreen.main.bounds.width * 5,
            height: UIScreen.main.bounds.height
        )
        scrollView.alwaysBounceVertical = false // 수직 스크롤 바운스 안되게
        
        pageControl.numberOfPages = 5
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
        // floor 내림, ceil 올림
        // contentOffset는 현재 스크롤된 좌표
    }
}

