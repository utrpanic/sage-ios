//
//  SGSplitViewController.swift
//  Sage
//
//  Created by gurren-l on 2017. 11. 15..
//  Copyright © 2017년 boxjeon. All rights reserved.
//

class SGSplitViewController: UISplitViewController {
    
    static func create() -> Self {
        return self.create(storyboardName: "Main")!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentsWithGesture = true
    }
    
}
