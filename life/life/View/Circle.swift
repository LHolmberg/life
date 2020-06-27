import UIKit

class Circle: UIView {
    
    func render() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 200, height: 200)).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        render()
    }
}
