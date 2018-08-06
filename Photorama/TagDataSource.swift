//
//  TagDataSource.swift
//  Photorama
//
//  Created by Liyu Wang on 5/8/18.
//  Copyright © 2018 Oasis. All rights reserved.
//

import UIKit

class TagDataSource: NSObject, UITableViewDataSource {
    
    var tags: [Tag] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        
        let tag = tags[indexPath.row]
        cell.textLabel?.text = tag.name
        
        return cell
    }
    
}
