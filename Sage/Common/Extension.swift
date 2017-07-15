//
//  Extension.swift
//  Sage
//
//  Created by gurren-l on 2017. 7. 15..
//  Copyright © 2017년 boxjeon. All rights reserved.
//

import Alamofire
import AlamofireImage

extension String {
    
    func substring(from: Int, count: Int) -> String {
        return String(self.dropFirst(from).prefix(count))
    }
    
}

extension UICollectionView {
    
    func registerNib(id: String) {
        self.register(UINib(nibName: id, bundle: nil), forCellWithReuseIdentifier: id)
    }
    
}

extension UIColor {
    
    convenience init?(hex: String?, alpha: CGFloat = 1.0) {
        guard let hex = hex?.replacingOccurrences(of: "#", with: ""), hex.count == 6 else {
            return nil
        }
        let r255 = Int(hex.substring(from: 0, count: 2), radix: 16)
        let g255 = Int(hex.substring(from: 2, count: 2), radix: 16)
        let b255 = Int(hex.substring(from: 4, count: 2), radix: 16)
        if let r255 = r255, let g255 = g255, let b255 = b255 {
            self.init(red: CGFloat(r255) / 255.0, green: CGFloat(g255) / 255.0, blue: CGFloat(b255) / 255.0, alpha: alpha)
        } else {
            return nil
        }
    }
    
}

extension UIImageView {

    func setImage(URL imageURL: URL, placeholder: UIImage?, completion: ((UIImage?) -> Void)?) {
        self.af_setImage(withURL: imageURL, placeholderImage: placeholder, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false) { (response) in
            if let image = response.result.value {
                completion?(image)
            } else {
                Log.d("Load image fail. from: \(imageURL.absoluteString)")
                completion?(nil)
            }
        }
    }

}

extension UITableView {
    
    func registerNib(id: String) {
        self.register(UINib(nibName: id, bundle: nil), forCellReuseIdentifier: id)
    }
    
}

extension UIView {
    
    class var id: String { return NSStringFromClass(self).components(separatedBy: ".").last! }
    
}

extension UIViewController {
    
    class var id: String { return NSStringFromClass(self).components(separatedBy: ".").last! }
    
    class func create(storyboardName: String) -> UIViewController? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: self.id)
    }
    
}
