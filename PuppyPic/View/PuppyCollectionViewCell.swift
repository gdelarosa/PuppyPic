//
//  PuppyCollectionViewCell.swift
//  PuppyPic
//
//  Created by Gina De La Rosa on 10/4/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit
import SDWebImage

class PuppyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var pupImage: UIImageView!
    @IBOutlet weak var pupLabel: UILabel!
    
    /// Will access the Puppy class to assign the data to the outlets.
    
    func recipe(result: Puppy) {
        pupImage.sd_setImage(with: result.imageURL)
        pupLabel.text = result.title
    }
}
