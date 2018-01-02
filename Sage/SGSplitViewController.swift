//
//  SGSplitViewController.swift
//  Sage
//
//  Created by gurren-l on 2017. 11. 15..
//  Copyright © 2017년 boxjeon. All rights reserved.
//

class SGSplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    override var traitCollection: UITraitCollection {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return super.traitCollection
        } else {
            let horizontalTraitCollection = UITraitCollection(horizontalSizeClass: .regular)
            let verticalTraitCollection = UITraitCollection(verticalSizeClass: .regular)
            let traitCollection = UITraitCollection(traitsFrom: [super.traitCollection, horizontalTraitCollection, verticalTraitCollection])
            return traitCollection
        }
    }
    
    var selectedMenu: Int? = nil
    
    static func create() -> Self {
        return self.create(storyboardName: "Main")!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentsWithGesture = true
        self.delegate = self
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.preferredDisplayMode = .automatic
        } else {
            self.preferredDisplayMode = .primaryHidden
        }
    }
    
    // MARK: - UISplitViewControllerDelegate
    func targetDisplayModeForAction(in svc: UISplitViewController) -> UISplitViewControllerDisplayMode {
        if svc.preferredDisplayMode == .automatic {
            return .automatic
        } else {
            if svc.displayMode == .primaryHidden {
                return .primaryOverlay
            } else {
                return .primaryHidden
            }
        }
    }
    
    /* When the split expands, it sets its current (and only) vc as the new primary. If you want to set another vc ad the primary, return it from this method */
    func primaryViewControllerForExpandingSplitViewController(splitViewController: UISplitViewController) -> UIViewController? {
        
        return nil
    }
    
    /* When the split collapses it uses its current primary vc as the new single vc. If you want it to set a different vc as the new vc, return it from this method */
    func primaryViewControllerForCollapsingSplitViewController(splitViewController: UISplitViewController) -> UIViewController? {
        
        return nil
    }
    
    /* This is called just before the split is collapsing. If this method return false, the split calls the primary's method "collapseSecondaryViewController:forSplitViewController" to give it a chance to do something with the secondary VC (who is disappearing). i.e. the NavigationController uses collapseSecondaryViewController:forSplitViewController to push the secondary as the new primary.
     
     If return true the split does nothing and the primary will be the single vc */
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        
        // if no photo selected, leave the primary as the main vc
        return self.selectedMenu == nil
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }
    
    /* When the split expands and this method return nil the split calls the primary VC method "separateSecondaryViewControllerForSplitViewController" to obtain the new secondary (the NavigationController reutrn the last vc popped from the stack as the new secondary), otherwise it uses this VC as the new secondary */
    func splitViewController(splitViewController: UISplitViewController, separateSecondaryViewControllerFromPrimaryViewController primaryViewController: UIViewController) -> UIViewController? {
        if self.selectedMenu != nil {
            return nil
        } else {
            // if no photo selected, push an empty secondary
            return DetailViewController()
        }
    }
    
}
