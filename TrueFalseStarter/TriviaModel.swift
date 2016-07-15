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
    
    let triviaGOT: [[String : String]] = [
        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA", "OptionA": "Robb Stark", "OptionB": "Jon Snow", "OptionC": "Brandon Stark", "OptionD": "Rickon Stark"],
        ["Question": "Which is not one of Daenarys' dragon?", "Answer": "OptionC", "OptionA": "Drogon", "OptionB": "Rhaegal", "OptionC": "Eragon", "OptionD": "Viserion"],
        ["Question": "What does Valar Morghulis mean?", "Answer": "OptionD", "OptionA": "Good morning", "OptionB": "All men must serve", "OptionC": "Good evening", "OptionD": "All men must die"],
        ["Question": "Who is the 'shame lady'?", "Answer": "OptionC", "OptionA": "Septa Nutella", "OptionB": "Septa Mordane", "OptionC": "Septa Unella", "OptionD": "Septa Eglatine"],
        ["Question": "Who was the last to stab Jon Snow?", "Answer": "OptionA", "OptionA": "Olly", "OptionB": "Thorne", "OptionC": "Yarwyck", "OptionD": "Marsh"],
        ["Question": "What is the title of the 9th episode of Season 6?", "Answer": "OptionC", "OptionA": "Blackwater", "OptionB": "The Rains of Castamere", "OptionC": "Battle of the Bastards", "OptionD": "The Winds of Winter"],
        ["Question": "Who is not a Lannister?", "Answer": "OptionD", "OptionA": "Tywin", "OptionB": "Cersei", "OptionC": "Lancel", "OptionD": "Mace"],
        ["Question": "Which house is from Dorne?", "Answer": "OptionB", "OptionA": "Tyrell", "OptionB": "Martell", "OptionC": "Clegane", "OptionD": "Arryn"],
        ["Question": "Who killed Balon Greyjoy?", "Answer": "OptionD", "OptionA": "Yara", "OptionB": "Aeron", "OptionC": "Theon", "OptionD": "Euron"],
        ["Question": "What does L+R=J mean?", "Answer": "OptionB", "OptionA": "Littlefinger+Robin=Joffrey", "OptionB": "Lyanna+Rhaegar=Jon", "OptionC": "Lady Stark+Red Wedding=Joyeuse Frey", "OptionD": "Lannister+Reed=Justice"]
    ]
    

    


//    let triviaAnswersGOT: [[String : String]] = [
//        [],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"],
//        ["Question": "Who is Eddard Stark's oldest son?", "Answer": "OptionA"]
//    ]
    
//    let trivia: [[String : String]] = [
//        ["Question": "Only female koalas can whistle", "Answer": "False"],
//        ["Question": "Blue whales are technically whales", "Answer": "True"],
//        ["Question": "Camels are cannibalistic", "Answer": "False"],
//        ["Question": "All ducks are birds", "Answer": "True"]
//    ]
    
//    func getRandomQuestion() -> [String : String] {
//        let indexOfSelectedQuestion: Int = GKRandomSource.sharedRandom().nextIntWithUpperBound(trivia.count)
//        return trivia[indexOfSelectedQuestion]
//    }
}