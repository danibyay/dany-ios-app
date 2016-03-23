//
//  DBGSignUpController.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 17/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class DBGLoginViewController: UIViewController {

    @IBOutlet weak var dbgEmail: UITextField!
    @IBOutlet weak var dbgPassword: UITextField!
    @IBOutlet weak var dbgLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        self.view.backgroundColor = UIColor.danyBaseColor()
        dbgEmail.layer.borderWidth = 2
        dbgPassword.layer.borderWidth = 2
        dbgEmail.layer.borderColor = UIColor.danyContrastColor().CGColor
        dbgPassword.layer.borderColor = UIColor.danyContrastColor().CGColor
        dbgLogin.layer.backgroundColor = UIColor.danyContrastColor().CGColor
        dbgEmail.text = "someone@gmail.com"
        dbgPassword.text = "Password123"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginWasPressed(sender: AnyObject) {
        if dbgEmail.text != "" && dbgPassword.text != "" {
            PFUser.logInWithUsernameInBackground(dbgEmail.text!, password: dbgPassword.text!, block: { (user: PFUser?, error: NSError?) -> Void in
                if error == nil {
                    print("user logged in successfully")
                    self.presentController("Bienvenido")
                } else {
                    print(error)
                }
            })
        }
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }
    
}

extension DBGLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == dbgEmail {
            dbgPassword.becomeFirstResponder()
        } else {
            loginWasPressed(self)
        }
        return true
    }
}
