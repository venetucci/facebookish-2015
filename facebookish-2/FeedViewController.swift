//
//  FeedViewController.swift
//  facebookish-2
//
//  Created by Michelle Venetucci Harvey on 2/27/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var isPresenting: Bool = true

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    var selectedImageView: UIImageView!
    var movingImageView: UIImageView!
    var fadeTransition: FadeTransition!
    var endTransition: CGRect!
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = feedImageView.frame.size

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as PhotoViewController
        destinationVC.image = selectedImageView.image
        var height = (selectedImageView.image!.size.height*320)/selectedImageView.image!.size.width
        endTransition = CGRect(x: 0, y: ((self.view.frame.size.height - height)/2), width: 320, height: height)
        
        
        imageTransition = ImageTransition()
        imageTransition.duration = 0.5
        imageTransition.endTransition = endTransition
        

        
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = imageTransition
        
        destinationVC.endTransition = imageTransition.endTransition
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        var imageView = sender.view as UIImageView
        selectedImageView = imageView
        performSegueWithIdentifier("photoSegue", sender: self)
    }
}
