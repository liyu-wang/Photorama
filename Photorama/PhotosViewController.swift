//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Liyu Wang on 3/8/18.
//  Copyright © 2018 Oasis. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        store.fetchInterestingPhotos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
