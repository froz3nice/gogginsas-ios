

import Foundation
import UIKit
extension UIViewController {
    
    func shareSound(fileName: String){
        let activityItem = URL.init(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: "mp3")!)
        
        let activityVC = UIActivityViewController(activityItems: [activityItem],applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
}
