//
//  LoginOrSignupViewController.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 23/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class LoginOrSignupViewController: UIViewController {

    
    @IBOutlet weak var dbgNotnow: UIButton!
    @IBOutlet weak var dbgSignup: DBGSimplebutton!
    @IBOutlet weak var dbgLogin: DBGSimplebutton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView()
    }

    func colorView(){
        self.view.backgroundColor = UIColor.danyBaseColor()
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }
    
   
    @IBAction func signupWasPressed(sender: AnyObject) {
        presentController("SignUp")
    }
    
    @IBAction func loginWasPressed(sender: AnyObject) {
        presentController("Login")
    }
    
    @IBAction func notnowWasPressed(sender: AnyObject) {
        presentController("Bienvenido")
    }

}
