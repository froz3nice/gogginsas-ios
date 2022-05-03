

import Foundation
import UIKit
import StoreKit

extension UIViewController {
    
    func addActionSheetForiPad(actionSheet: UIAlertController) {
        if let popoverPresentationController = actionSheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
    }
    
    func rateApp() {
        func rateApp() {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
                
            } else if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "1618110820") {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    func saveImage(image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
    }
    
    func showToast(message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
