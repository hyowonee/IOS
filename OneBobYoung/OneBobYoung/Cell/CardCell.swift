//
//  CardCell.swift
//  OneBobYoung
//
//  Created by Hyowon Choi on 2018. 3. 4..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import Foundation
import TisprCardStack
import CRToast

class CardCell: TisprCardStackViewCell {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answer1Button: UIButton!
    @IBOutlet var answer2Button: UIButton!
    @IBOutlet var answer3Button: UIButton!
    @IBOutlet var answer4Button: UIButton!
    
    var question: Question!
    
    var block: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 5
        clipsToBounds = false
    }
    
    override internal func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
    }
    
    func setQuestion(question: Question, index: Int) {
        self.question = question
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        
        let attrString = NSMutableAttributedString(string: "문제 \(index).\n\"\(question.text)\" 의 뜻은?")
        attrString.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        questionLabel.attributedText = attrString
        questionLabel.textAlignment = .center
        
        answer1Button.setTitle("1. \(question.answerList[0])", for: .normal)
        answer2Button.setTitle("2. \(question.answerList[1])", for: .normal)
        answer3Button.setTitle("3. \(question.answerList[2])", for: .normal)
        answer4Button.setTitle("4. \(question.answerList[3])", for: .normal)
    }
    
    @IBAction func selectAnswer(sender: UIButton) {
        if sender.tag == question.realAnswerIndex {
            CRToastManager.showNotification(options: [
                kCRToastTextKey: "정답!",
                kCRToastBackgroundColorKey: UIColor.green,
                kCRToastTextColorKey: UIColor.black,
                kCRToastTimeIntervalKey: 0.2,
                kCRToastNotificationTypeKey: CRToastType.navigationBar.rawValue,
                kCRToastFontKey: UIFont.boldSystemFont(ofSize: 24)
                ], completionBlock: nil)
        } else {
            CRToastManager.showNotification(options: [
                kCRToastTextKey: "틀렸습니다..",
                kCRToastBackgroundColorKey: UIColor.red,
                kCRToastTimeIntervalKey: 0.2,
                kCRToastNotificationTypeKey: CRToastType.navigationBar.rawValue,
                kCRToastFontKey: UIFont.boldSystemFont(ofSize: 24)
                ], completionBlock: nil)
        }
        self.block?()
    }
}
