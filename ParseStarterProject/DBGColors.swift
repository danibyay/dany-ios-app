//
//  DBGColors.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 17/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
extension UIColor {
    
    class func danyBaseColor() -> UIColor {
        return UIColor(hexString: "FFFFFF")!
    }
    
    class func danyContrastColor() -> UIColor {
        return UIColor(hexString: "#9AB0E6")!
        //4CD964 era el verde
    }
    
    class func danySecondContrastColor() -> UIColor {
        return UIColor(hexString: "9AB0E6")!
        //FFCC00 era el amarillo
    }
    
}