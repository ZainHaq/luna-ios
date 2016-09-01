//
//  UIColor+Hex.swift
//  Luna
//
//  Created by Zain on 9/1/16.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func hexColor(string: String) -> UIColor {
        let set = NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet
        var colorString = string.stringByTrimmingCharactersInSet(set).uppercaseString
        
        if (colorString.hasPrefix("#")) {
            colorString = colorString.substringFromIndex(colorString.startIndex.advancedBy(1))
        }
        
        if (colorString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue: UInt32 = 0
        NSScanner(string: colorString).scanHexInt(&rgbValue)
        
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue:  CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}