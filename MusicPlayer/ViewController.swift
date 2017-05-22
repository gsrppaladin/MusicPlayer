//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Sam Greenhill on 5/16/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var songTimeLbl: UILabel!
    
    @IBOutlet var songNameLbl: UILabel!
    
    @IBOutlet var timeSlider: UISlider!
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBOutlet var volumeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func viewDidLayoutSubviews() {
        
        volumeSlider.transform = CGAffineTransform(rotationAngle: -(CGFloat)(M_PI_2))
        
        var temp: CGRect = volumeSlider.frame
        temp.origin.x = volumeButton.frame.origin.x
        temp.origin.y = volumeButton.frame.origin.y - volumeSlider.frame.height
        
        volumeSlider.frame = temp
        
    }

    @IBAction func songTimeBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
    }
    
    @IBAction func nxtPressed(_ sender: UIButton) {
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
    }
    
    @IBAction func volumePressed(_ sender: UIButton) {
    }
    
    @IBAction func shufflePressed(_ sender: UIButton) {
    }
    
    @IBAction func repeatPressed(_ sender: UIButton) {
    }

    @IBAction func timeSliderChanged(_ sender: UISlider) {
    }
    @IBAction func volumeSliderChanged(_ sender: UISlider) {
    }
    
    
}

