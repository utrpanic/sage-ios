//
//  Extension.swift
//  Sage
//
//  Created by gurren-l on 2017. 7. 15..
//  Copyright © 2017년 boxjeon. All rights reserved.
//

import Alamofire
import AlamofireImage

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
