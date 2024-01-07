//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTime : [String:Int] = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]
    var secondsRemaining = 60
    
    var timer = Timer()
    
    
    @IBAction func herdnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        
        secondsRemaining = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsRemaining > 0 {
            print("\(secondsRemaining) second")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done"
        }
    }
}
