//
//  DBGWelcomeViewController.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 23/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class DBGWelcomeViewController: UIViewController {

    
    @IBOutlet weak var DBGBuscar: DBGSimplebutton!
    @IBOutlet weak var DBGAnunciar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColors()
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
}
