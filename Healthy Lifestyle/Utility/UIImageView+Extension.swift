//
//  UIImageView+Extension.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/14/21.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    @discardableResult
    func fetchImage(url: String, indicator: UIActivityIndicatorView? = nil) -> URLSessionDataTask? {
        let urlString = url as NSString
        if let cachedImage = imageCache.object(forKey: urlString) {
            self.image = cachedImage
            return nil
        }
        indicator?.startAnimating()
        self.image = UIImage(systemName: "placeholder-image")
        let dataTask = GetImageData(absoluteURLString: url).executeRequest { [weak self] in
            indicator?.stopAnimating()
            if case .success(let imageData) = $0, let image = UIImage(data: imageData) {
                self?.image = image
                imageCache.setObject(image, forKey: urlString)
            }
        }
        return dataTask
    }
}
