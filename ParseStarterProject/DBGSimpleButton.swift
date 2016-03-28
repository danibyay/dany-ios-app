//
//  DBGSimpleButton.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 24/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class DBGSimplebutton: UIButton {
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        self.layer.backgroundColor = UIColor.danyContrastColor().CGColor
    }
  
}
