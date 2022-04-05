//
//  PhraseViewController.swift
//  GogginsMotivation
//
//  Created by Martynas Brazionis on 2022-04-04.
//

import Foundation
import UIKit

class PhraseViewController: UIViewController {
    
    var myCollectionView:UICollectionView?
    var data = Util.getPhrasesData()
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        initCollectionView()

        title = "All Phrases"
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func initCollectionView(){
     
        let layout = UICollectionViewLayout()
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        myCollectionView?.contentInsetAdjustmentBehavior = .always
    
        myCollectionView?.register(PhraseCell.self, forCellWithReuseIdentifier: PhraseCell.identifier)
        

        view.addSubview(myCollectionView ?? UICollectionView())
        
        myCollectionView?.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
}

