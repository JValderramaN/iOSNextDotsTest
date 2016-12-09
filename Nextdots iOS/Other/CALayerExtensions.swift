//
//  CALayerExtensions.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/9/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: 1000000)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: frame.width, y: 0, width: thickness, height: frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        border.zPosition = 10000
        self.addSublayer(border)
    }
}
