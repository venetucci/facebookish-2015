//
//  FeedViewController.swift
//  facebookish-2
//
//  Created by Michelle Venetucci Harvey on 2/27/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    var selectedImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = feedImageView.frame.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as PhotoViewController
        destinationVC.image = selectedImage
        // destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        // destinationVC.transitioningDelegate = self
        
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        var imageView = sender.view as UIImageView
        selectedImage = imageView.image
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
