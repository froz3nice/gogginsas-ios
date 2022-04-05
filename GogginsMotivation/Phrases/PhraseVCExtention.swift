//
//  PhraseVCExtention.swift
//  GogginsMotivation
//
//  Created by Martynas Brazionis on 2022-04-04.
//

import Foundation
import UIKit
extension PhraseViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhraseCell.identifier, for: indexPath) as! PhraseCell
       // cell.label.text = data[indexPath.row].stage
        return cell
        
    }

}

extension PhraseViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
    
}
