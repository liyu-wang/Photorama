//
//  Photo.swift
//  Photorama
//
//  Created by Liyu Wang on 3/8/18.
//  Copyright © 2018 Oasis. All rights reserved.
//

import Foundation

class Photo {
    let title: String
    let remoteURL: URL
    let photoID: String
    let dataTaken: Date
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dataTaken = dateTaken
    }
}
