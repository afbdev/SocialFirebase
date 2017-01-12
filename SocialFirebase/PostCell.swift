//
//  PostCell.swift
//  SocialFirebase
//
//  Created by afbdev on 1/11/17.
//  Copyright © 2017 afbdev. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(post: Post, image: UIImage? = nil) {
        self.post = post
        self.caption.text = post.caption
        self.likesLabel.text = String(post.likes)
        
        if image != nil {
            self.postImage.image = image
        } else {
            let ref = FIRStorage.storage().reference(forURL: post.imageUrl)
            ref.data(withMaxSize: 8 * 1024 * 1024, completion: { (data, error) in
                if (error != nil) {
                    print("FIRStorage: Unable to download image from Firebase storage")
                } else {
                    print("FIRStorage: Image downloaded from Firebase storage")
                    if let imageData = data {
                        if let img = UIImage(data: imageData) {
                            self.postImage.image = img
                            FeedVC.imageCache.setObject(img, forKey: self.post.imageUrl as NSString)
                        }
                    }
                }
            })
            
        }
        
    }

}
