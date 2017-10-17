//
//  ViewController.swift
//  S4L51AppEggTimer
//
//  Created by Martin Berger on 10/13/17.
//  Copyright © 2017 Martin Berger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var time = 210
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var play: UIBarButtonItem!
    @objc func decreseTimer() {
        if time > 0 {
        time -= 1
        timerLabel.text = String(time)
        } else {
            timer.invalidate()
        }
    }
    
    @IBAction func play(_ sender: Any) {
        if play.isEnabled {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreseTimer), userInfo: nil, repeats: true)
            play.isEnabled = false
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
        play.isEnabled = true
    }
    
    @IBAction func reset(_ sender: Any) {
        time = 210
        timerLabel.text = String(time)
    }
    
    @IBAction func minusTen(_ sender: Any) {
        if time > 10 {
        time -= 10
        timerLabel.text = String(time)
        }
    }
    
    @IBAction func plusTen(_ sender: Any) {
        time += 10
        timerLabel.text = String(time)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        play.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

