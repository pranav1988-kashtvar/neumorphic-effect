//
//  NeumorphicButton.swift
//  neumorphicEffect
//
//  Created by Shi Pra on 03/10/22.
//

import UIKit

@IBDesignable
class NeumorphicButton: UIButton {
    
    public var bevel = 3
    
    override var isHighlighted: Bool {
        didSet { isHighlighted ? pressed() : released() }
    }
        
    override var isEnabled: Bool {
        didSet{ isHighlighted ? released() : pressed() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        initialSetup()
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.masksToBounds = false
        initialSetup()
    }
    
    func initialSetup() {
        
        addNeumorphicLayer(superView: self.superview)
    }
    
    func pressed() {
        self.layer.shadowOffset = CGSize(width: -2, height: -2)
        self.layer.sublayers?[0].shadowOffset = CGSize(width: 2, height: 2)
    }
    
    func released() {
        self.layer.shadowOffset = CGSize(width: bevel, height: bevel)
        self.layer.sublayers?[0].shadowOffset = CGSize(width: -bevel, height: -bevel)
    }
    
    func addNeumorphicLayer(cornerRadius: CGFloat = 20.0, superView: UIView? = nil) {
        let colorLight = UIColor(red: 227/255, green: 230/255, blue: 234/255, alpha: 1.0)
        let lightShadow = UIColor(red: 209/255, green: 217/255, blue: 230/255, alpha: 1.0).cgColor
        
        if (self.layer.sublayers?[0] as? CAShapeLayer) != nil {
            self.layer.sublayers?.remove(at: 0)
        }
        
        let shadowLayer = CAShapeLayer()
        
        self.layer.cornerRadius = cornerRadius
        self.layer.cornerCurve = .continuous
        shadowLayer.cornerRadius = cornerRadius
        shadowLayer.cornerCurve = .continuous
        
        self.layer.shadowRadius = 2
        shadowLayer.shadowRadius = 2
        
        self.layer.shadowOpacity = 1
        shadowLayer.shadowOpacity = 1
        
        self.layer.shadowOffset = CGSize(width: bevel, height: bevel)
        shadowLayer.shadowOffset = CGSize(width: -bevel, height: -bevel)
        
        let activeColor = colorLight
        
        self.layer.shadowColor = lightShadow
        shadowLayer.shadowColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        shadowLayer.frame = bounds
        self.layer.backgroundColor = activeColor.cgColor
        shadowLayer.backgroundColor = activeColor.cgColor
        
        if superView != nil {
            superview?.backgroundColor = activeColor
        }
        
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
}
