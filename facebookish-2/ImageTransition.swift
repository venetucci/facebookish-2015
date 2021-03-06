//
//  ImageTransition.swift
//  facebookish-2
//
//  Created by Michelle Venetucci Harvey on 2/28/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var feedViewController = fromViewController as FeedViewController
        feedViewController.selectedImageView.hidden = true
        
        var photoViewController = toViewController as PhotoViewController
        photoViewController.imageView.hidden = true
        
        var movingImageView = UIImageView(image: feedViewController.selectedImageView.image)
        movingImageView.contentMode = feedViewController.selectedImageView.contentMode
        movingImageView.clipsToBounds = feedViewController.selectedImageView.clipsToBounds
        containerView.addSubview(movingImageView)
        
        var frame = containerView.convertRect(feedViewController.selectedImageView.frame, fromView: feedViewController.scrollView)
        movingImageView.frame = frame
        
       
        
        toViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            movingImageView.frame = self.endTransition
        }) { (finished: Bool) -> Void in
            self.finish()
            photoViewController.imageView.hidden = false
            movingImageView.removeFromSuperview()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var feedViewController = toViewController as FeedViewController
        feedViewController.selectedImageView.hidden = false
        
        var photoViewController = fromViewController as PhotoViewController
        photoViewController.imageView.hidden = false
        
        var movingImageView = UIImageView(image: feedViewController.selectedImageView.image)
        movingImageView.frame = photoViewController.imageView.frame
        movingImageView.contentMode = feedViewController.selectedImageView.contentMode
        movingImageView.clipsToBounds = feedViewController.selectedImageView.clipsToBounds
        containerView.addSubview(movingImageView)
        
        var frame = containerView.convertRect(feedViewController.selectedImageView.frame, fromView: feedViewController.scrollView)
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            movingImageView.frame = frame
            }) { (finished: Bool) -> Void in
                self.finish()
                movingImageView.removeFromSuperview()
                fromViewController.view.removeFromSuperview()
        }
    }
}
