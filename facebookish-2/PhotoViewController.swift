//
//  PhotoViewController.swift
//  facebookish-2
//
//  Created by Michelle Venetucci Harvey on 2/27/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var photoActionsImage: UIImageView!
    @IBOutlet weak var doneButtonImage: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var image: UIImage!
    var endTransition: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        imageView.image = image
        imageView.frame = endTransition
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func didPressDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var newImagePoint = imageView.frame.origin
        
        doneButtonImage.alpha = 1 - (scrollView.contentOffset.y / -60)
        println("height: \(scrollView.contentOffset)")
        
        photoActionsImage.alpha = 1 - (scrollView.contentOffset.y / -60)
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
        
        println("height: \(scrollView.contentOffset)")
            
        if scrollView.contentOffset.y < -60 {
            dismissViewControllerAnimated(true, completion: nil)
            imageView.alpha = 0
            doneButtonImage.hidden = true
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
    }

}
