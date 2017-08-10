//
//  ViewController.swift
//  tapmefast
//
//  Created by Tyler Stanish on 8/10/17.
//  Copyright © 2017 Tyler Stanish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tapMeButton: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    
    var timer = Timer()
    
    var timeInt = 0
    var scoreInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        timeInt = 10
        scoreInt = 0
        
        timerLabel.text = String(timeInt)
        scoreLabel.text = String(scoreInt)
        
        tapMeButton.isEnabled = false
        tapMeButton.alpha = 0.4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func tapMe(_ sender: Any) {
        scoreInt += 1
        scoreLabel.text = String(scoreInt)
    }
    @IBAction func startGame(_ sender: Any) {
        if(timeInt == 10){
            scoreInt = 0
            scoreLabel.text = String(scoreInt)
            
            tapMeButton.isEnabled = true
            tapMeButton.alpha = 1
            
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.4
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.startCounter), userInfo: nil, repeats: true)
        }
        if(timeInt == 0){
            timeInt = 10
            scoreInt = 0
            
            timerLabel.text = String(timeInt)
            scoreLabel.text = String(scoreInt)
            
            startGameButton.setTitle("START GAME", for: [])
        }
    }
    
    func startCounter(){
        timeInt -= 1
        timerLabel.text = String(timeInt);
        if(timeInt == 0){
            timer.invalidate()
            
            tapMeButton.isEnabled = false
            tapMeButton.alpha = 0.4
            
            startGameButton.isEnabled = true
            startGameButton.alpha = 1
            
            startGameButton.setTitle("RESTART", for: [])
        }
    }


}

