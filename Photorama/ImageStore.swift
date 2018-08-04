//
//  ImageStore.swift
//  Homepwner
//
//  Created by Liyu Wang on 4/8/18.
//  Copyright © 2018 Oasis. All rights reserved.
//

import UIKit

class ImageStore {

    let cache = NSCache<NSString, UIImage>()

    func setImage(_ image: UIImage, forKey key: String) {
        // Add to cache
        cache.setObject(image, forKey: key as NSString)

        // Store to disk

        // Create full URL for image
        let url = imageURL(forKey: key)

        // Turn image into PNG data

        if let data = UIImagePNGRepresentation(image) {
            // Write it to full URL
            try? data.write(to: url, options: [.atomic])
        }
    }

    func image(forKey key: String) -> UIImage? {
        // if available, read image from cache
        if let existingImage = cache.object(forKey: key as NSString) {
            return existingImage
        }

        // else read from disk
        let url = imageURL(forKey: key)
        guard let imageFromDisk = UIImage(contentsOfFile: url.path) else {
            return nil
        }

        // if read from disk, add to cache
        cache.setObject(imageFromDisk, forKey: key as NSString)

        return imageFromDisk
    }

    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)

        let url = imageURL(forKey: key)
        do {
            try FileManager.default.removeItem(at: url)
        } catch let deleteError {
            print("Error removing the image from disk: \(deleteError)")
        }
    }

    func imageURL(forKey key: String) -> URL {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent(key)
    }

}
