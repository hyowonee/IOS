//
//  TestViewController.swift
//  OneBobYoung
//
//  Created by Hyowon Choi on 2018. 2. 18..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import TisprCardStack

class TestViewController: TisprCardStackViewController, TisprCardStackViewControllerDelegate {
    var questions: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setAnimationSpeed(0.85)
        
        let size = CGSize(width: view.bounds.width - 40, height: 2 * view.bounds.height / 3)
        setCardSize(size)
        
        cardStackDelegate = self
        layout.topStackMaximumSize = 4
        layout.bottomStackMaximumSize = 30
        layout.bottomStackCardHeight = 45
        
        for _ in 0..<100 {
            if Int(arc4random() % 2) == 0 {
                questions.append(Question(status: .englishQuestion))
            } else {
                questions.append(Question(status: .koreanQuestion))
            }
        }
    }
    
    override func numberOfCards() -> Int {
        return 100
    }
    
    override func card(_ collectionView: UICollectionView, cardForItemAtIndexPath indexPath: IndexPath) -> TisprCardStackViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        
        cell.setQuestion(question: questions[indexPath.row], index: indexPath.row + 1)
        cell.block = {
            self.moveCardDown()
        }
        return cell
    }
    
    @objc func cardDidChangeState(_ cardIndex: Int) {
    }
}
