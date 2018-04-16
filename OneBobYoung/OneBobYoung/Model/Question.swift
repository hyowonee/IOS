//
//  Question.swift
//  OneBobYoung
//
//  Created by Hyowon Choi on 2018. 3. 4..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import Foundation

enum TestStatus {
    case englishQuestion
    case koreanQuestion
}

class Question {
    var text: String = ""
    var answerList: [String] = ["", "", "", ""]
    var realAnswerIndex: Int = 0
    
    init(status: TestStatus) {
        guard let questionSentence = Sentence.random() else {
            return
        }
        self.realAnswerIndex = Int(arc4random() % 4)
        
        switch status {
        case .englishQuestion:
            self.text = questionSentence.english
            for index in 0..<4 {
                repeat {
                    let sentence = Sentence.random()!
                    self.answerList[index] = sentence.korean
                } while self.answerList[index] == questionSentence.korean
            }
            self.answerList[self.realAnswerIndex] = questionSentence.korean
        case .koreanQuestion:
            self.text = questionSentence.korean
            for index in 0..<4 {
                repeat {
                    let sentence = Sentence.random()!
                    self.answerList[index] = sentence.english
                } while self.answerList[index] == questionSentence.english
            }
            self.answerList[self.realAnswerIndex] = questionSentence.english
        }
    }
}
