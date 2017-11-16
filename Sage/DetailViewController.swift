//
//  DetailViewController.swift
//  Sage
//
//  Created by gurren-l on 2017. 7. 15..
//  Copyright © 2017년 boxjeon. All rights reserved.
//

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var detailItem: NSDate? {
        didSet {
            self.configureView()
        }
    }
    
    static func create() -> Self {
        return self.create(storyboardName: "Main")!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationItem()
        
        self.configureView()
    }

    func setupNavigationItem() {
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        self.navigationItem.leftItemsSupplementBackButton = true
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }
    
    @IBAction func didButtonTap(_ sender: UIButton) {
        let viewController = DetailViewController.create()
//        let navigationController = UINavigationController(rootViewController: viewController)
//        self.present(navigationController, animated: true, completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

