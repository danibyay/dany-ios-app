//
//  DBGWelcomeViewController.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 23/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class DBGWelcomeViewController: UIViewController {
    
    var counter = 0
    var onboardingVC: OnboardingViewController!

    @IBOutlet weak var DBGBuscar: DBGSimplebutton!
    @IBOutlet weak var DBGAnunciar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColors()
        setupOnboarding()
    }
    
    override func viewDidAppear(animated: Bool) {
        if counter == 0 && PFUser.currentUser()?.isNew == true{
            self.presentViewController(onboardingVC, animated: false, completion: nil)
            counter++
        }
    }
    
    func setColors(){
        self.view.backgroundColor = UIColor.danyBaseColor()
        DBGAnunciar.layer.backgroundColor = UIColor.danySecondContrastColor().CGColor
    }

    @IBAction func buscarWasPressed(sender: AnyObject) {
        self.presentController("NavigationController")
    }
    @IBAction func anunciarWasPressed(sender: AnyObject) {
        print("no hay nada aquí aún")
    }

    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
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
                onboardingVC.allowSkipping = true
                onboardingVC.skipHandler = {() -> Void in
                    self.onboardingVC.dismissViewControllerAnimated(true, completion: nil)
                }
        onboardingVC.shouldMaskBackground = false
        onboardingVC.titleTextColor = UIColor.blackColor()
        onboardingVC.bodyTextColor = UIColor.blackColor()
        //que skip sea negro
        onboardingVC.view.backgroundColor = UIColor.danyContrastColor()
        
        
        
    }

}
