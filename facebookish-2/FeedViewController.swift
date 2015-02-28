//
//  FeedViewController.swift
//  facebookish-2
//
//  Created by Michelle Venetucci Harvey on 2/27/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    var selectedImageView: UIImageView!
    var movingImageView: UIImageView!
    var fadeTransition: FadeTransition!
    // End the transition with the image at the right size:
    var endTransition: CGRect!
    
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = feedImageView.frame.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        movingImageView = UIImageView(frame: selectedImageView.frame)
        movingImageView.image = selectedImageView.image
        movingImageView.contentMode = selectedImageView.contentMode
        movingImageView.clipsToBounds = selectedImageView.clipsToBounds
        
        endTransition = CGRect(x: 0, y: (568 - self.selectedImageView.frame.height)/2, width: 320, height: (self.selectedImageView.frame.height*320)/self.selectedImageView.frame.width)

        var window = UIApplication.sharedApplication().keyWindow!
        window.addSubview(movingImageView)
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            var photoViewController = toViewController as PhotoViewController
            var finalImageView = photoViewController.imageView
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                self.movingImageView.frame = finalImageView.frame
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as PhotoViewController
        destinationVC.image = selectedImageView.image
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
        imageTransition = ImageTransition()
        imageTransition.duration = 3
        
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = imageTransition
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        var imageView = sender.view as UIImageView
        selectedImageView = imageView
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
