//
//  MARListOfArticlesViewController.swift
//  iOSitesm2016
//
//  Created by miguelicious on 2/15/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class MARListOfArticlesViewController: UITableViewController {
    
    var photos : [PFFile] = []
    var titles : [String] = []
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
        
        let query = PFQuery(className: "Articles")
        query.whereKey("owner", equalTo: (PFUser.currentUser())! )
        query.selectKeys(["description", "image"])
        query.orderByDescending("createdAt")
        
        query.findObjectsInBackgroundWithBlock { (result: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                // Success
                self.titles.removeAll()
                self.photos.removeAll()
                for object in result! {
                    self.titles.append(object["description"] as! String)
                    self.photos.append(object["image"] as! PFFile)
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
        cell.marLabel.text = titles[indexPath.row]
        
        photos[indexPath.row].getDataInBackgroundWithBlock({ (data: NSData?, error: NSError?) -> Void in
            cell.marImage.image = UIImage(data: data!)
        })
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 170
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow;
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as! MARArticlesCell!;
        
        descriptionToPass = currentCell.marLabel!.text
        do{
            imageDataToPass = try photos[indexPath!.row].getData()
        }catch _ {
            print("cant use image")
        }
        performSegueWithIdentifier("edit", sender: self)
    }
    
}
