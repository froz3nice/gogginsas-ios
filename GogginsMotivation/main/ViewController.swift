//
//  ViewController.swift
//  GogginsMotivation
//
//  Created by Martynas Brazionis on 2022-04-04.
//

import UIKit

class ViewController: UIViewController, SoundsCallback {
    
    var mainImage: UIImageView!
    var left:  UIButton!
    var right: UIButton!
    var play:  UIButton!
    let mainLabel : PaddingLabel = {
        let lbl = PaddingLabel()
        lbl.textColor = .black
        lbl.font = UIFont(name:"Avenir-Medium",size: 20)
        lbl.textAlignment = .center
        lbl.layer.backgroundColor = #colorLiteral(red: 0.7606601119, green: 0.7893477678, blue: 0.7482238412, alpha: 0.7967952703).cgColor
        lbl.lineBreakMode = .byClipping
        lbl.numberOfLines = 0
        return lbl
    }()
    var soundPlayer: SoundManager!
    var imageSize = 50.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        soundPlayer = SoundManager(callback: self, isContinous: true, data: Util.getPhrasesData().shuffled())
        
        // Do any additional setup after loading the view.
    }
    
    func initUI() {
        mainImage = UIImageView(image: UIImage(named: "gog"))
        mainImage.frame = UIScreen.main.bounds
        mainImage.contentMode = .scaleAspectFill
        
        let stackView   = UIStackView()
        
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        stackView.axis  = .horizontal
        stackView.distribution  = .equalSpacing
        stackView.alignment = .center
        
        left = UIButton(type: .custom)
        right = UIButton(type: .custom)
        play = UIButton(type: .custom)
        if UIDevice().userInterfaceIdiom == .pad {
            imageSize = 100.0
        }
        left.setImage(UIImage(named: "next")?.resize(maxWidthHeight: imageSize), for: .normal)
        right.setImage(UIImage(named: "next")?.resize(maxWidthHeight: imageSize), for: .normal)
        play.setImage(UIImage(named: "play")?.resize(maxWidthHeight: imageSize), for: .normal)
        
        left.setImage(UIImage(named: "next2")?.resize(maxWidthHeight: imageSize), for: .highlighted)
        right.setImage(UIImage(named: "next2")?.resize(maxWidthHeight: imageSize), for: .highlighted)
        
        
        left.isUserInteractionEnabled = true
        right.isUserInteractionEnabled = true
        play.isUserInteractionEnabled = true
        
        let leftTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(leftTap))
        let rightTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rightTap))
        let playTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(playTap))
        
        left.addGestureRecognizer(leftTapGestureRecognizer)
        right.addGestureRecognizer(rightTapGestureRecognizer)
        left.transform = left.transform.rotated(by: .pi)// 180˚
        play.addGestureRecognizer(playTapGestureRecognizer)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainImage)
        view.addSubview(stackView)
        view.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8).isActive = true
        
        stackView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150, enableInsets: false)
        
        stackView.addArrangedSubview(left)
        stackView.addArrangedSubview(play)
        stackView.addArrangedSubview(right)
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.tappedOnScreen))
        view.addGestureRecognizer(gesture)
    }
    
    func enablePreviousButton(enable: Bool) {
        left.isEnabled = enable
    }
    
    func enableNextButton(enable: Bool) {
        right.isEnabled = enable
    }
    
    func setMainText(text: String) {
        mainLabel.text = text
    }
    
    @objc func leftTap(sender: UITapGestureRecognizer){
        soundPlayer.setPreviousSound()
        stopSounds()
    }
    
    @objc func rightTap(sender: UITapGestureRecognizer){
        soundPlayer.setNextSound()
        stopSounds()
    }
    
    @objc func playTap(sender: UITapGestureRecognizer){
        print("tap")
        if (soundPlayer.isPlaying) {
            stopSounds()
        } else {
            soundPlayer.playContinousSounds()
        }
        changeIcon()
    }
    
    func stopSounds() {
        soundPlayer.stop()
        changeIcon()
    }
    
    func changeIcon() {
        if (soundPlayer.isPlaying) {
            play.setImage(UIImage(named: "pause")!.resize(maxWidthHeight: imageSize), for: .normal)
        } else {
            play.setImage(UIImage(named: "play")!.resize(maxWidthHeight: imageSize), for: .normal)
        }
    }
    
    @objc func tappedOnScreen(sender: UITapGestureRecognizer){
        print("tap")
        soundPlayer.stop()
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        addActionSheetForiPad(actionSheet: alert)
        
        alert.addAction(
            .init(title: "Show all phrases", style: .default) { _ in
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "phrases") as! PhraseViewController
                self.navigationController?.pushViewController(newViewController, animated: true)
            }
        )
        
        alert.addAction(
            .init(title: "Share sound", style: .default) { _ in
                self.shareSound(fileName: self.soundPlayer.data[self.soundPlayer.index].soundRes)
            }
        )
        
        alert.addAction(
            .init(title: "Rate app", style: .default) { _ in
                self.rateApp()
            }
        )
        alert.addAction(
            .init(title: "Cancel", style: .cancel) { _ in
                alert.dismiss(animated: true, completion: nil)
            }
        )
        present(alert, animated: true)
    }
}

