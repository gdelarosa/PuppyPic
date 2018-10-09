//
//  Puppy.swift
//  PuppyPic
//
//  Created by Gina De La Rosa on 10/4/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import Foundation
import SwiftyJSON

class Puppy {
    
    let imageURL: URL
    var title: String = ""
    
    init(imageURL: URL) {
        self.imageURL = imageURL
    }
    
    /// Convenience required init will call the designated init method for the imageURL.
    
    convenience required init?(data: JSON) {
        
        if let image = data["thumbnail"].url {
            self.init(imageURL: image)
        } else {
            print("Error: Unable to retrieve images")
            return nil
        }
        
        if let title = data["title"].string {
            self.title.append(title)
        } else {
            print("Error: Unable to return a title")
            return nil
        }
    }
}

struct ResultString {
    static let Result = "results"
}
