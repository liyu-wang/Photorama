//
//  PhotoStore.swift
//  Photorama
//
//  Created by Liyu Wang on 3/8/18.
//  Copyright © 2018 Oasis. All rights reserved.
//

import Foundation

enum PhotoResult {
    case success([Photo])
    case failure(Error)
}

class PhotoStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    private func processPhotosRequest(data: Data?, error: Error?) -> PhotoResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return FlickrAPI.photos(fromJSON: jsonData)
    }
    
    func fetchInterestingPhotos(completion: @escaping (PhotoResult) -> Void) {
        let url = FlickrAPI.interestingPhotoURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            
            let result = self.processPhotosRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
}
