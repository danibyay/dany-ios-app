//
//  MARLoginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by miguelicious on 2/4/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class DBGSignupViewController: UIViewController {

    var onboardingVC: OnboardingViewController!
    @IBOutlet weak var marEmail: DBGSimpleTextField!
    @IBOutlet weak var marPassword: DBGSimpleTextField!
    @IBOutlet weak var marSignUp: DBGSimplebutton!
    @IBOutlet weak var dbgExit: DBGCrossButton!
    
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupOnboarding()
    }
    
    func setUpView(){
        self.view.backgroundColor = UIColor.danyBaseColor()
        marEmail.text = "someone@gmail.com"
        marPassword.text = "Password123"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupOnboarding(){
        let firstPage = OnboardingContentViewController(title: "Busca", body: "Cuartos en renta cerca de tu escuela", image: UIImage(named: "logo"), buttonText: nil)
            { () -> Void in }
        let secondPage = OnboardingContentViewController(title: "Anuncia", body: "Tu cuarto disponible y todos sus detalles", image: UIImage(named: "logo"), buttonText: nil){ () -> Void in }
        
        let thirdPage = OnboardingContentViewController(title: "Encuentra", body: "Dónde y con quién vivir de acuerdo a tus necesidades", image: UIImage(named: "logo"), buttonText: "Comenzar")
            { () -> Void in
                self.onboardingVC.dismissViewControllerAnimated(true, completion: nil)
            }
        thirdPage.buttonTextColor = UIColor.blackColor()
        onboardingVC = OnboardingViewController(backgroundImage: nil, contents: [firstPage, secondPage, thirdPage])
//        onboardingVC.allowSkipping = true
//        onboardingVC.skipHandler = {() -> Void in
//            print("holai")
//            self.onboardingVC.dismissViewControllerAnimated(true, completion: nil)
//        }
        onboardingVC.shouldMaskBackground = false
        onboardingVC.titleTextColor = UIColor.blackColor()
        onboardingVC.bodyTextColor = UIColor.blackColor()
        onboardingVC.skipButton.tintColor = UIColor.blackColor()
        onboardingVC.view.backgroundColor = UIColor.danyContrastColor()
        

        
    }
    
    func loginAfterSignup(){
        PFUser.logInWithUsernameInBackground(marEmail.text!, password: marPassword.text!, block: { (user: PFUser?, error: NSError?) -> Void in
            if error == nil {
//                if user!.isNew == true{
//                    self.presentViewController(self.onboardingVC, animated: true, completion: {() -> Void in print("completed") })
//                }else {
                    self.presentController("Bienvenido")
                //}
                print("user logged in successfully")
                print("user is new \(user!.isNew)")
            } else {
                print(error)
            }
        })
    }
    
    @IBAction func SignUpWasPressed(sender: AnyObject) {
        if marEmail.text != "" && marPassword.text != "" {
            let user = PFUser()
            user.username = marEmail.text
            user.email = marEmail.text
            user.password = marPassword.text
            
            user.signUpInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                if success {
                    print("User signed up successfully")
                } else {
                    print(error)
                }
            })
            
            loginAfterSignup()
            
            
        }
    }
    @IBAction func exitWasPressed(sender: AnyObject) {
        print("cross was pressed")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }

}

extension DBGSignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == marEmail {
            marPassword.becomeFirstResponder()
        } else {
            SignUpWasPressed(self)
        }
        return true
    }
}
