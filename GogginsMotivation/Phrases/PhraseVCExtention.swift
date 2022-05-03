import Foundation
import UIKit
extension PhraseViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhraseCell.identifier, for: indexPath) as! PhraseCell
        cell.mainLabel.text =  data[indexPath.row].soundText
        cell.playButton.tag =  indexPath.row
        cell.playButton.addTarget(self, action: #selector(playPress), for: .touchUpInside)
        cell.moreButton.tag = indexPath.row
        cell.moreButton.addTarget(self, action: #selector(morePress), for: .touchUpInside)
        return cell
        
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
}

extension PhraseViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
        playSound(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, cellWidth: CGFloat) -> CGFloat {
        let height = requiredHeight(text: data[indexPath.row].soundText, cellWidth: cellWidth)
        return height
    }
    
    func requiredHeight(text:String , cellWidth : CGFloat) -> CGFloat {
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: cellWidth, height: .greatestFiniteMagnitude))
        label.font = UIFont(name:"Avenir-Medium",size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = text
        label.sizeToFit()
        return label.frame.height
        
    }
    
}
