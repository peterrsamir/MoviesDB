//
//  UIImageView+Extension.swift
//  MoviesDB
//
//  Created by Peter Samir on 18/08/2024.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: NetworkConstants.APIConstatnts.imageURLPath+urlString) else {
            return
        }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        self.kf.setImage(with: resource)
    }
}
