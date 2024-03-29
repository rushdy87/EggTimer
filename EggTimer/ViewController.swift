//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTime : [String:Int] = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]
    
    var timer = Timer()
    
    var totalTime = 0
    var secondPassed = 0

    var audioPlayer = AVAudioPlayer()
    
    
    @IBAction func herdnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        
        totalTime = eggTime[hardness]!
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondPassed < totalTime {
            secondPassed += 1
            
            progressBar.progress = Float(secondPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "Done"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")

        audioPlayer = try! AVAudioPlayer(contentsOf: url!)

        audioPlayer.play()



    }
}
