//
//  DBGWelcomeViewController.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 23/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class DBGWelcomeViewController: UIViewController {

    @IBOutlet weak var DBGBuscar: UIButton!
    @IBOutlet weak var DBGAnunciar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColors()
    }
    
    func setColors(){
        self.view.backgroundColor = UIColor.danyBaseColor()
        DBGBuscar.layer.backgroundColor = UIColor.danyContrastColor().CGColor
        DBGAnunciar.layer.backgroundColor = UIColor.danySecondContrastColor().CGColor
    }

    @IBAction func buscarWasPressed(sender: AnyObject) {
        print("buscar was pressed")
    }
    @IBAction func anunciarWasPressed(sender: AnyObject) {
        print("no hay nada aquí aún")
    }

}
