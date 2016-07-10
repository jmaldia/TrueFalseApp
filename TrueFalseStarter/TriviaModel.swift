//
//  TriviaModel.swift
//  TrueFalseStarter
//
//  Created by Jon Maldia on 7/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import GameKit

class TriviaModel {
    let trivia: [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]
    ]
    
    func getRandomQuestion() -> [String : String] {
        let indexOfSelectedQuestion: Int = GKRandomSource.sharedRandom().nextIntWithUpperBound(trivia.count)
        return trivia[indexOfSelectedQuestion]
    }
}