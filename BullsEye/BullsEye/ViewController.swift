//
//  ViewController.swift
//  BullsEye
//
//  Created by Alireza Khibari on 2024-05-21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!

    var currentValue: Int = 0
    var targetValue = 0
    var score = 0
    var round = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points

        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
        title: "Hello, World",
        message: message,    // changed
        preferredStyle: .alert)

       let action = UIAlertAction(
        title: "OK",          // changed
        style: .default,
        handler: nil)

      alert.addAction(action)

      present(alert, animated: true, completion: nil)
      startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    func startNewRound() {
      round += 1
      targetValue = Int.random(in: 1...100)
      currentValue = 50
      slider.value = Float(currentValue)
      updateLabels()
    }
    
    func updateLabels() {
      targetLabel.text = String(targetValue)
      scoreLabel.text = String(score) 
      roundLabel.text = String(round)
    }

}

