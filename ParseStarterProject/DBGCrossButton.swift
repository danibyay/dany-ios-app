//
//  DBGCrossButton.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 31/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class DBGCrossButton: UIButton {
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    override func drawRect(rect: CGRect) {
        
        //these are the key points to draw a cross "x" of 20 x 20
        let dbgCenter = CGPointMake(10,10)
        let dbgUpperLeftCorner = CGPointMake(0, 0)
        let dbgDownLeftCorner = CGPointMake(0, 20)
        let dbgUpRightCorner = CGPointMake(20, 0)
        let dbgDownRightCorner = CGPointMake(20, 20)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(dbgUpperLeftCorner)
        bezierPath.addLineToPoint(dbgCenter)
        UIColor.blackColor().setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(dbgDownLeftCorner)
        bezier2Path.addLineToPoint(dbgCenter)
        UIColor.blackColor().setStroke()
        bezier2Path.lineWidth = 1
        bezier2Path.stroke()
        // Bezier 3
        let bezier3Path = UIBezierPath()
        bezier3Path.moveToPoint(dbgDownRightCorner)
        bezier3Path.addLineToPoint(dbgCenter)
        UIColor.blackColor().setStroke()
        bezier3Path.lineWidth = 1
        bezier3Path.stroke()
        // Bezier 4
        let bezier4Path = UIBezierPath()
        bezier4Path.moveToPoint(dbgUpRightCorner)
        bezier4Path.addLineToPoint(dbgCenter)
        UIColor.blackColor().setStroke()
        bezier4Path.lineWidth = 1
        bezier4Path.stroke()
    }
}
