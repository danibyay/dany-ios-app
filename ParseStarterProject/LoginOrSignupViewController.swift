//
//  LoginOrSignupViewController.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 23/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class LoginOrSignupViewController: UIViewController {

    @IBOutlet weak var dbgSignup: UIButton!
    @IBOutlet weak var dbgLogin: UIButton!
    @IBOutlet weak var dbgNotnow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView()
    }

    func colorView(){
        dbgSignup.layer.backgroundColor = UIColor.danyContrastColor().CGColor
        dbgLogin.layer.backgroundColor = UIColor.danyContrastColor().CGColor
        self.view.backgroundColor = UIColor.danyBaseColor()
    }
    
    @IBOutlet weak var notnowWasPressed: UIButton!
    @IBOutlet weak var loginWasPressed: UIButton!
    @IBAction func signupWasPressed(sender: AnyObject) {
    }

}
