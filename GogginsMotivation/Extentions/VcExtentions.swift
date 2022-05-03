//
//  VcExtentions.swift
//  GogginsMotivation
//
//  Created by Martynas Brazionis on 2022-05-02.
//

import Foundation
import UIKit

extension UIApplication {
    func getScreenshot() -> UIImage? {
        guard let window = keyWindow else { return nil }
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        window.drawHierarchy(in: bounds, afterScreenUpdates: true)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIViewController {
    
}

extension UICollectionView {
    func reloadData(completion:@escaping ()->()) {
        UIView.animate(withDuration: 0, animations: reloadData)
            { _ in completion() }
    }
}

