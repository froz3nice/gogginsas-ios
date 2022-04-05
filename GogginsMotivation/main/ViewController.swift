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
    var phrases = Util.getPhrasesData()
    var soundPlayer: SoundManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        soundPlayer = SoundManager(callback: self)
        
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
        
        left.setImage(UIImage(named: "next")?.resize(maxWidthHeight: 50), for: .normal)
        right.setImage(UIImage(named: "next")?.resize(maxWidthHeight: 50), for: .normal)
        play.setImage(UIImage(named: "play")?.resize(maxWidthHeight: 50), for: .normal)
        
        left.setImage(UIImage(named: "next2")?.resize(maxWidthHeight: 50), for: .highlighted)
        right.setImage(UIImage(named: "next2")?.resize(maxWidthHeight: 50), for: .highlighted)
        
        
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
        
        stackView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 70, enableInsets: false)
        
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
            play.setImage(UIImage(named: "pause")!.resize(maxWidthHeight: 50), for: .normal)
        } else {
            play.setImage(UIImage(named: "play")!.resize(maxWidthHeight: 50), for: .normal)
        }
    }
    
    @objc func tappedOnScreen(sender: UITapGestureRecognizer){
        print("tap")
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        addActionSheetForiPad(actionSheet: alert)

        
        alert.addAction(
            .init(title: "Show all phrases", style: .default) { _ in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "phrases")
                self.navigationController?.pushViewController(vc, animated: true)
            }
        )
        
        alert.addAction(
            .init(title: "Share sound", style: .default) { _ in
              
            }
        )

        alert.addAction(
            .init(title: "Download image", style: .default) { _ in
               
            }
        )
        
        alert.addAction(
            .init(title: "Rate app", style: .default) { _ in
               
            }
        )
        alert.addAction(
            .init(title: "Cancel", style: .cancel) { _ in
                alert.dismiss(animated: true, completion: nil)
            }
        )
        present(alert, animated: true)
    }
    
    public func addActionSheetForiPad(actionSheet: UIAlertController) {
      if let popoverPresentationController = actionSheet.popoverPresentationController {
        popoverPresentationController.sourceView = self.view
        popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        popoverPresentationController.permittedArrowDirections = []
      }
    }
}

