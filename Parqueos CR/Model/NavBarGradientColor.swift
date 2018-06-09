//
//  NavBarGradientColor.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 29/5/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import UIKit

class NavBarGradientColor: UINavigationBar {
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, middleGradientColor: middleGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var middleGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, middleGradientColor: middleGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, middleGradientColor: middleGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, middleGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor, let middleGradientColor = middleGradientColor{
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, middleGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 1)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}
