import UIKit

class GradientView: UIView {
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0/255.0, green: 119/255.0, blue: 161/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0/255.0, green: 120/255.0, blue: 136/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [1.0, 1.0]
        gradientLayer.frame = self.frame
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGradientBackground()
    }
}
