//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Sam Greenhill on 5/16/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    
    @IBOutlet var songTimeLbl: UILabel!
    
    @IBOutlet var songNameLbl: UILabel!
    
    @IBOutlet var timeSlider: UISlider!
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBOutlet var volumeButton: UIButton!
    
    
    var musicFiles = [String]()
    var currentIndex = 0 // will track currently played or to be played song index. 
    
    var musicPlayer = AVAudioPlayer()
    
    var timer = Timer()
    var volumeShowing = false
    var repeatOn = false
    var shuffleOn = false
    var timeRemaining = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        songNameLbl.text = ""
        songTimeLbl.text = "00:00"
        timeSlider.value = 0
        
        loadSoundTracks()
        
        if musicFiles.count > 0 {
            playMusic()
        }
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        
    }

    
    func updateSlider() {
        
        timeSlider.value = Float(musicPlayer.currentTime)
        
        if !timeRemaining {
            songTimeLbl.text = getTime(currentTime: musicPlayer.currentTime)
        } else {
            songTimeLbl.text = getTime(currentTime: musicPlayer.duration - musicPlayer.currentTime)
        }
    }
    
    func getTime(currentTime: TimeInterval) -> String {
        
        let current = currentTime
        
        let minutes = Int(current / 60)
        let seconds = Float(current).truncatingRemainder(dividingBy: 60)
        
        let minuteString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        let secondString = seconds >= 10 ? String(format: "%.2f", seconds) : "0" + String(format: "%.2f", seconds)
        
        if !timeRemaining {
            return minuteString + ":" + secondString
        } else {
            return "-" + minuteString + ":" + secondString
        }
        
    }
    
    func loadSoundTracks() {
        let resourcePath = Bundle.main.resourcePath!
        var directoryContents = [String]()
        
        do {
            directoryContents = try FileManager.default.contentsOfDirectory(atPath: resourcePath) as [String]
        } catch {
            print("error in catching directory content")
        }
        for i in 0...directoryContents.count - 1 {
            let fileExtention: String = (directoryContents[i] as NSString).pathExtension as String
            
            if fileExtention == "mp3" {
                let fileName = directoryContents[i]
                musicFiles.append(fileName)
            }
        }
        print(musicFiles)
    }
    
    func playMusic() {
        let filePath = Bundle.main.path(forResource: musicFiles[currentIndex], ofType: nil)
        
        let fileURL = URL(fileURLWithPath: filePath!)
        
        
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: fileURL)
        } catch {
            print("Error initiating music player")
        }
        
        musicPlayer.delegate = self
        timeSlider.minimumValue = 0
        timeSlider.maximumValue = Float(musicPlayer.duration)
        
        timeSlider.value = Float(musicPlayer.currentTime)
        
        musicPlayer.volume = volumeSlider.value
        
        musicPlayer.play()
        songNameLbl.text = musicFiles[currentIndex]
    }
    
    
    override func viewDidLayoutSubviews() {
        
        volumeSlider.transform = CGAffineTransform(rotationAngle: -(CGFloat)(M_PI_2))
        
        var temp: CGRect = volumeSlider.frame
        temp.origin.x = volumeButton.frame.origin.x
        temp.origin.y = volumeButton.frame.origin.y - volumeSlider.frame.height
        
        volumeSlider.frame = temp
        
    }

    @IBAction func songTimeBtnPressed(_ sender: UIButton) {
        
        timeRemaining = !timeRemaining
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

