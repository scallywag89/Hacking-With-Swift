//
//  ViewController.swift
//  Project2
//
//  Created by Bennett Mackenzie on 3/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var askedQuestions = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany",
                      "ireland", "italy", "monaco",
                      "nigeria", "poland", "russia",
                      "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) || Score: \(score)"
        askedQuestions += 1
    }
    
    func reset(action: UIAlertAction) {
        score = 0
        askedQuestions = 0
        
        askQuestion(action: nil)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, that is \(countries[sender.tag].uppercased())'s flag!"
            score -= 1
        }
        
        if askedQuestions < 10 {
            let alertController = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alertController, animated: true)
        } else {
            let secondAlertController = UIAlertController(title: "Game Over", message: "You got \(score)/10", preferredStyle: .alert)
            secondAlertController.addAction(UIAlertAction(title: title, style: .default, handler: reset))
            present(secondAlertController, animated: true)
        }
    }
    
}

