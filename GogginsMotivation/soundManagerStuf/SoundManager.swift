//
//  SoundManager.swift
//  GogginsMotivation
//
//  Created by Martynas Brazionis on 2022-04-04.
//

import Foundation
import AVFoundation

class SoundManager: NSObject, AVAudioPlayerDelegate {
       
    var mediaPlayer: AVAudioPlayer?
    var data = Util.getPhrasesData()
    var index = 0
    var isPlaying = false
    var callback: SoundsCallback? = nil
    
    init(callback: SoundsCallback?) {
        /// this codes for making this app ready to takeover the device audio
        super.init()
        data = data.shuffled()
        self.callback = callback
        self.checkPrevious()
        self.callback?.setMainText(text: data[index].soundText)
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch {
            print("error")
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool){
        setNextSound()
        playContinousSounds()
    }
    
    func playContinousSounds() {
        playSound(index: self.index)
    }
    
    func playSound(index: Int){
        let name = "\(data[index].soundRes)"
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
        do {
            //mediaPlayer = nil
            mediaPlayer = try AVAudioPlayer(contentsOf: url)
            mediaPlayer?.delegate = self
            mediaPlayer?.play()
            isPlaying = true
        } catch {
            print("could not load file")
        }
    }
    
    func setPreviousSound() {
        if (index > 0){
            index = index - 1
        }
        checkPrevious()
        callback?.enableNextButton(enable: true)
        slide(right: false)
    }
    
    func setNextSound() {
        if (index < data.count - 1){
            index += 1
        }
        checkNext()
        callback?.enablePreviousButton(enable: true)
        slide(right: true)
    }
    
    func slide(right: Bool) {
        callback?.setMainText(text: data[index].soundText)
    }
    
    private func checkPrevious() {
        if (index == 0){
            callback?.enablePreviousButton(enable: false)
        }
    }
    
    private func checkNext() {
        if (index == data.count - 1){
            index = 0
        }
    }
    
    func stop() {
        mediaPlayer = nil
        isPlaying = false
    }
}
