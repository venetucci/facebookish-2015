//
//  PhotoViewController.swift
//  facebookish-2
//
//  Created by Michelle Venetucci Harvey on 2/27/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    var endTransition: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        imageView.frame = endTransition
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didPressDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }

}
