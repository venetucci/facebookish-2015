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
    @IBOutlet weak var blackView: UIView!
    var image: UIImage!
    var endTransition: CGRect!
    let blackColor = UIColor(white: 0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        blackView.backgroundColor = blackColor
        imageView.image = image
        imageView.frame = endTransition
        
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
        var offsetFade = 1 - (scrollView.contentOffset.y / -60)
        
        doneButtonImage.alpha = offsetFade
        photoActionsImage.alpha = offsetFade
        blackView.alpha = offsetFade
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            
        if scrollView.contentOffset.y < -60 {
            dismissViewControllerAnimated(true, completion: nil)
            imageView.alpha = 0
            doneButtonImage.hidden = true
            
        }
    }

}
