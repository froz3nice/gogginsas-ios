
import Foundation
import UIKit

class PhraseViewController: UIViewController {
    
    var myCollectionView:UICollectionView?
    
    var data = Util.getPhrasesData()
    var soundPlayer: SoundManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        soundPlayer = SoundManager(callback: nil, isContinous: false,data: self.data)
        
        title = "All Phrases"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func playPress(_ sender: UIButton) {
        let index = sender.tag
        soundPlayer.playSound(index: index)
    }
    
    func playSound(index: Int){
        soundPlayer.playSound(index: index)
    }
    
    @objc func morePress(_ sender: UIButton){
        let index = sender.tag
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        addActionSheetForiPad(actionSheet: alert)
        
        alert.addAction(
            .init(title: "Share sound", style: .default) { _ in
                self.shareSound(fileName: self.data[index].soundRes)
            }
        )
        
        alert.addAction(
            .init(title: "Cancel", style: .cancel) { _ in
                alert.dismiss(animated: true, completion: nil)
            }
        )
        present(alert, animated: true)
    }
    
    func initCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 1
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.register(PhraseCell.self, forCellWithReuseIdentifier: PhraseCell.identifier)
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        myCollectionView?.contentInsetAdjustmentBehavior = .always
        myCollectionView?.isHidden = true
        
        view.addSubview(myCollectionView ?? UICollectionView())
        
        myCollectionView?.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myCollectionView?.reloadData {
            self.myCollectionView?.isHidden = false
        }
    }
}

