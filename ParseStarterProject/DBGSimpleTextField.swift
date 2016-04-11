//
//  DBGSimpleTextField.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 28/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class DBGSimpleTextField: UITextField {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blackColor().CGColor
    }
}
