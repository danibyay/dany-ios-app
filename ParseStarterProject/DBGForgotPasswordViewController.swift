//
//  DBGForgotPasswordViewController.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 23/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class DBGForgotPasswordViewController: UIViewController {

    @IBOutlet weak var dbgEmail: DBGSimpleTextField!
    @IBOutlet weak var dbgForgotPassword: DBGSimplebutton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        self.view.backgroundColor = UIColor.danyBaseColor()
    }
    
    @IBAction func forgotPasswordWasPressed(sender: AnyObject) {
        if dbgEmail.text != "" {
            let alertController = UIAlertController(title: "Keep calm", message: "Recibirás un correo para reestablecer tu contraseña en unos minutos", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }else {
            let alertController = UIAlertController(title: "Oops!", message: "Por favor, escribe un correo válido", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }


}

extension DBGForgotPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == dbgEmail {
            forgotPasswordWasPressed(self)
        }
        return true
    }
}
