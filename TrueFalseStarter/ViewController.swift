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
    
    let questionsPerRound = 6
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var gameSound: SystemSoundID = 0
    var gameSoundWin: SystemSoundID = 0

    // moved array to TriviaModel.swift
    
    let triviaModel = TriviaModel() // changed old trivia array to trivia instance of TriviaModel Struct
    
    
    @IBOutlet weak var questionField: UILabel!
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
        
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(triviaModel.triviaGOT.count)
        
        let optionsDictionary = triviaModel.triviaGOT[indexOfSelectedQuestion]
        
        questionField.text = optionsDictionary["Question"]
        
        optionAButton.setTitle(optionsDictionary["OptionA"], forState: .Normal)
        optionBButton.setTitle(optionsDictionary["OptionB"], forState: .Normal)
        optionCButton.setTitle(optionsDictionary["OptionC"], forState: .Normal)
        optionDButton.setTitle(optionsDictionary["OptionD"], forState: .Normal)
        playAgainButton.hidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        optionAButton.hidden = true
        optionBButton.hidden = true
        optionCButton.hidden = true
        optionDButton.hidden = true
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        playWinStartSound()
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = triviaModel.triviaGOT[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict["Answer"]
        
        if (sender === optionAButton &&  correctAnswer == "OptionA") || (sender === optionBButton &&  correctAnswer == "OptionB")  || (sender === optionCButton &&  correctAnswer == "OptionC") || (sender === optionDButton && correctAnswer == "OptionD") {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, the answer is \(selectedQuestionDict[correctAnswer!])!"
        }

        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
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
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func playWinStartSound() {
        AudioServicesPlaySystemSound(gameSoundWin)
    }
}

