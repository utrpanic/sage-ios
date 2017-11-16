//
//  AppDelegate.swift
//  Sage
//
//  Created by gurren-l on 2017. 7. 15..
//  Copyright © 2017년 boxjeon. All rights reserved.
//

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        let splitViewController = window!.rootViewController as! UISplitViewController
//        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
//        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
//        splitViewController.delegate = self
        
        let splitViewcontroller = SGSplitViewController.create()
        splitViewcontroller.delegate = self
        let mainViewController = MainViewController()
        mainViewController.splitViewcontroller = splitViewcontroller
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = mainViewController
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view
    
    var selectedMenu: Int? = nil
    
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
    
//    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
//        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
//        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
//        if topAsDetailController.detailItem == nil {
//            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
//            return true
//        }
//        return false
//    }
    
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

