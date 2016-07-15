//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 10
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var listOfQuestionsAsked: [Int] = []
    
    var gameSound: SystemSoundID = 0
    var gameSoundWin: SystemSoundID = 0
    
    // Sounds for correct and incorrect answers
    var correctAnswer: SystemSoundID = 0
    var wrongAnswer: SystemSoundID = 0

    // moved array to TriviaModel.swift
    
    let triviaModel = TriviaModel() // changed old trivia array to trivia instance of TriviaModel Struct
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answerField: UILabel!
    @IBOutlet weak var optionAButton: UIButton!
    @IBOutlet weak var optionBButton: UIButton!
    @IBOutlet weak var optionCButton: UIButton!
    @IBOutlet weak var optionDButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        questionsAsked += 1
        
        // Check if question has been asked
        while listOfQuestionsAsked.contains(indexOfSelectedQuestion) {
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(triviaModel.triviaGOT.count)
        }
        
        // Add index to list of asked questions
        listOfQuestionsAsked.append(indexOfSelectedQuestion)
        
        let optionsDictionary = triviaModel.triviaGOT[indexOfSelectedQuestion]
        
        questionField.text = optionsDictionary["Question"]
        
        optionAButton.setTitle(optionsDictionary["OptionA"], forState: .Normal)
        optionBButton.setTitle(optionsDictionary["OptionB"], forState: .Normal)
        optionCButton.setTitle(optionsDictionary["OptionC"], forState: .Normal)
        optionDButton.setTitle(optionsDictionary["OptionD"], forState: .Normal)
        playAgainButton.hidden = true
        answerField.hidden = true
        
        // loadNextRoundWithDelay(seconds: 15)
    }
    
    func displayScore() {
        // Hide the answer buttons
        
        optionAButton.hidden = true
        optionBButton.hidden = true
        optionCButton.hidden = true
        optionDButton.hidden = true
        answerField.hidden = true
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        playWinStartSound()
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        
        let selectedQuestionDict = triviaModel.triviaGOT[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict["Answer"]
        let answer = selectedQuestionDict[(correctAnswer)!]
        
        if (sender === optionAButton &&  correctAnswer == "OptionA") || (sender === optionBButton &&  correctAnswer == "OptionB")  || (sender === optionCButton &&  correctAnswer == "OptionC") || (sender === optionDButton && correctAnswer == "OptionD") {
            correctQuestions += 1
            correctAnswerSound()
            questionField.text = "Correct!"
        } else {
            answerField.hidden = false
            wrongAnswerSound()
            questionField.text = "Sorry, your answer is incorrect!"
            answerField.text = "The answer is \(answer)!"
        }

        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
            listOfQuestionsAsked = [] // reset list of questions asked
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        optionAButton.hidden = false
        optionBButton.hidden = false
        optionCButton.hidden = false
        optionDButton.hidden = false
        answerField.hidden = true
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSoundGOT", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
        
        let pathToSoundFileWin = NSBundle.mainBundle().pathForResource("winOrDie", ofType: "wav")
        let soundURLWin = NSURL(fileURLWithPath: pathToSoundFileWin!)
        AudioServicesCreateSystemSoundID(soundURLWin, &gameSoundWin)
        
        let pathToSoundFileCorrect = NSBundle.mainBundle().pathForResource("correct", ofType: "wav")
        let soundURLCorrect = NSURL(fileURLWithPath: pathToSoundFileCorrect!)
        AudioServicesCreateSystemSoundID(soundURLCorrect, &correctAnswer)
        
        let pathToSoundFileWrong = NSBundle.mainBundle().pathForResource("wrong", ofType: "m4r")
        let soundURLWrong = NSURL(fileURLWithPath: pathToSoundFileWrong!)
        AudioServicesCreateSystemSoundID(soundURLWrong, &wrongAnswer)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func playWinStartSound() {
        AudioServicesPlaySystemSound(gameSoundWin)
    }
    
    func correctAnswerSound() {
        AudioServicesPlaySystemSound(correctAnswer)
    }
    
    func wrongAnswerSound() {
        AudioServicesPlaySystemSound(wrongAnswer)
    }
}

