//
//  MyStyle.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 19/02/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation

import GradientCircularProgress

public struct MyStyle : StyleProperty {
    /*** style properties **********************************************************************************/
     
     // Progress Size
    public var progressSize: CGFloat = 150
    
    // Gradient Circular
    public var arcLineWidth: CGFloat = 15.0
    public var startArcColor: UIColor = UIColor.clearColor()
    public var endArcColor: UIColor = UIColor.purpleColor()
    
    // Base Circular
    public var baseLineWidth: CGFloat? = 19.0
    public var baseArcColor: UIColor? = UIColor.darkGrayColor()
    
    // Ratio
    public var ratioLabelFont: UIFont? = UIFont(name: "Verdana-Bold", size: 16.0)
    public var ratioLabelFontColor: UIColor? = UIColor.whiteColor()
    
    // Message
    public var messageLabelFont: UIFont? = UIFont.systemFontOfSize(16.0)
    public var messageLabelFontColor: UIColor? = UIColor.purpleColor()
    
    // Background
    public var backgroundStyle: BackgroundStyles = .Light
    
    /*** style properties **********************************************************************************/
    
    public init() {}
}