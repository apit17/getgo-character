//
//  UIImageView+Extensions.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 21/12/22.
//

import UIKit
import SDWebImage

extension UIImageView {

    /// Set Image from String of URL
    /// - Parameters:
    ///   - urlString: URL String
    ///   - placeholderImage: optional, use this if want to make different image than "ic_img_placeholder_small"
    func setImage(withUrlString urlString: String?) {
        guard let url = URL(string: urlString ?? "") else {
            return self.image = UIImage()
        }
        self.sd_setImage(with: url)
    }
}
