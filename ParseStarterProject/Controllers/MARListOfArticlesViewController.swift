//
//  MARListOfArticlesViewController.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 2/15/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class MARListOfArticlesViewController: UITableViewController {
    
    var photos : [PFFile] = []
    var colonias : [String] = []
    var precios : [String] = []
    var descriptionToPass: String!
    var imageDataToPass: NSData!
    var myobjects: [PFObject] = []
    @IBOutlet var danyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MARArticlesCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        loadItems()
        self.refreshControl?.addTarget(self, action: "loadItems", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func loadItems() {
        
        let query = PFQuery(className: "Anuncios")
        query.whereKey("owner", equalTo: (PFUser.currentUser())! )
        query.selectKeys(["Colonia", "Precio", "thumbnail"])
        query.orderByDescending("createdAt")
        
        query.findObjectsInBackgroundWithBlock { (result: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                // Success
                self.colonias.removeAll()
                self.photos.removeAll()
                for object in result! {
                    self.colonias.append(object["Colonia"] as! String)
                    self.precios.append(object["Precio"] as! String)
                    self.photos.append(object["thumbnail"] as! PFFile)
                }
                self.danyTableView.reloadData()
                self.refreshControl?.endRefreshing()
            } else {
                // Error
            }
        }
    }
    
    
    //parece que aquí sale el warning 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "create" {
            print("it usually works")
        }
        if segue.identifier == "edit" {
            print("edit segue is running")
            let editVC = segue.destinationViewController as? EditArticleViewController
            editVC?.articleDescription  = descriptionToPass
            editVC?.imagedata = imageDataToPass
        }
    }
    
}


// MARK: UITableviewDatasource & UITableViewDelegate
extension MARListOfArticlesViewController {
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MARArticlesCell
        cell.dbgColonia.text = colonias[indexPath.row]
        cell.dbgPrecio.text = precios[indexPath.row]
        
        photos[indexPath.row].getDataInBackgroundWithBlock({ (data: NSData?, error: NSError?) -> Void in
            cell.dbgFoto.image = UIImage(data: data!)
        })
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colonias.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 170
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow;
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as! MARArticlesCell!;
        
        descriptionToPass = currentCell.dbgColonia!.text
        
        do{
            imageDataToPass = try photos[indexPath!.row].getData()
        }catch _ {
            print("cant use image")
        }
        performSegueWithIdentifier("edit", sender: self)
    }
    
}
