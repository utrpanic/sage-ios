//
//  MainViewController.swift
//  Sage
//
//  Created by gurren-l on 2017. 11. 15..
//  Copyright © 2017년 boxjeon. All rights reserved.
//

class MainViewController : UIViewController {
    
    private func forceNewTrait() {
        if let splitViewcontroller = self.splitViewcontroller {
            if UIDevice.current.userInterfaceIdiom == .pad {
                splitViewcontroller.preferredDisplayMode = .automatic
            } else {
                splitViewcontroller.preferredDisplayMode = .primaryOverlay
                let horizontalTraitCollection = UITraitCollection(horizontalSizeClass: .regular)
                let verticalTraitCollection = UITraitCollection(verticalSizeClass: .regular)
                let collection = UITraitCollection(traitsFrom: [horizontalTraitCollection, verticalTraitCollection])
                self.setOverrideTraitCollection(collection, forChildViewController: splitViewcontroller)
            }
        }
    }
    
    var splitViewcontroller : UISplitViewController? = nil {
        didSet {
            if let oldValue = oldValue {
                oldValue.willMove(toParentViewController: nil)
                oldValue.view.removeFromSuperview()
                oldValue.removeFromParentViewController()
                self.setOverrideTraitCollection(nil, forChildViewController: oldValue)
                
            }
            if let splitViewController = self.splitViewcontroller {
                self.addChildViewController(splitViewController)
                self.view.addSubview(splitViewController.view)
                splitViewController.didMove(toParentViewController: self)
                self.forceNewTrait()
                
            }
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.forceNewTrait()
        super.viewWillTransition(to: size, with: coordinator)
    }
    
}
