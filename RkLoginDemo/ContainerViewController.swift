//
//  ContainerViewController.swift
//  HumOS
//
//  Created by Deepesh.Sunku on 9/12/16.
//  Copyright © 2016 Sikka Software. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case bothCollapsed
    case leftPanelExpanded
    case rightPanelExpanded
}

protocol ContainerViewDelegate {
    func hideNavBar()
    func showNavBar()
}

class ContainerViewController: UIViewController {
    
    var delegate:ContainerViewDelegate?
    
    var centerNavigationController: UINavigationController!
    var centerViewController: UIViewController!
    
    var currentState: SlideOutState = .bothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .bothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    var leftViewController: UINavigationController?
    var menuViewController: HomeViewController?
    
    var leftPanelFlag = false
    
    let centerPanelExpandedOffset: CGFloat = 240   // actual value is 60 given by him
    let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIApplication.shared.statusBarFrame.width, height: UIApplication.shared.statusBarFrame.height+3))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerViewController = UIStoryboard.centerViewController()
        
        // wrap the centerViewController in a navigation controller, so we can push views to it
        // and display bar button items in the navigation bar
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        centerNavigationController.isNavigationBarHidden = false
       // navBar.barTintColor = UIColor(rgba:"#0D3546")
        self.view.addSubview(navBar);
        
        navBar.isHidden = true
        centerNavigationController.didMove(toParentViewController: self)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ContainerViewController.handlePanGesture(_:)))
        centerNavigationController.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

}

extension ContainerViewController {
    
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        
        animateLeftPanel(notAlreadyExpanded)
    }
    
    func collapseSidePanels() {
        toggleLeftPanel()
    }
    
    func addChildSidePanelController(_ sidePanelController: UINavigationController) {
        view.insertSubview(sidePanelController.view, at: 0)
        addChildViewController(sidePanelController)
        sidePanelController.didMove(toParentViewController: self)
    }
    
    func addLeftPanelViewController() {
        if (leftViewController == nil) {
            leftViewController = UIStoryboard.leftViewController()
            addChildSidePanelController(leftViewController!)
        }
    }
    
    func animateCenterPanelXPosition(_ targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: {
            self.centerNavigationController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
    
    func animateLeftPanel(_ shouldExpand: Bool) {
        if (shouldExpand) {
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(centerNavigationController.view.frame.width - centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(0) { finished in
                self.currentState = .bothCollapsed
                self.leftPanelFlag = false
                self.navBar.isHidden = true
                //self.delegate?.hideNavBar()
                self.leftViewController!.view.removeFromSuperview()
                self.leftViewController = nil;
            }
        }
    }
    
    func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            centerNavigationController.view.layer.shadowOpacity = 0.0
        } else {
            centerNavigationController.view.layer.shadowOpacity = 0.0
        }
    }
    
}

extension ContainerViewController: UIGestureRecognizerDelegate {
    // MARK: Gesture recognizer
    
    func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: view).x > 0)
//        if(UserSession.sharedSession.isUserSessionValid()){
            switch(recognizer.state) {
            case .began:
                if (currentState == .bothCollapsed) {
                    if (gestureIsDraggingFromLeftToRight) {
                        leftPanelFlag = true
                        //self.delegate?.showNavBar()
                        navBar.isHidden = false
                        addLeftPanelViewController()
                    }
                    showShadowForCenterViewController(true)
                }
            case .changed:
                if(recognizer.view!.center.x >= 187.5 && leftPanelFlag) {
                    recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translation(in: view).x
                    recognizer.setTranslation(CGPoint.zero, in: view)
                }
            case .ended:
                if (leftViewController != nil) {
                    if(recognizer.velocity(in: view).x > -50) {
                        animateLeftPanel(true)
                    } else if(recognizer.velocity(in: view).x < 50) {
                        animateLeftPanel(false)
                    } else {
                        let hasMovedGreaterThanHalfway = recognizer.view!.center.x > 0
                        animateLeftPanel(hasMovedGreaterThanHalfway)
                    }
                }
            default:
                break
            }
//        }
    }
}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    
    class func leftViewController() -> UINavigationController? {
        let chatNavController:UINavigationController = (mainStoryboard().instantiateViewController(withIdentifier: "HomeViewNavigationController") as? UINavigationController)!
        return chatNavController
    }
    
    class func centerViewController() -> UIViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "viewController") as? UIViewController
    }
    
}
