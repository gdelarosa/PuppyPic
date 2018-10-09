//
//  RecipeRouter.swift
//  PuppyPic
//
//  Created by Gina De La Rosa on 10/4/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

// MARK: - Network Request
class RecipeRouter {
    
    /// Using an enum to create one case for the URL request
    enum Router: URLRequestConvertible {
        case getResults
        
        var path: String {
            switch self {
            case .getResults: return ""
            }
        }
        
        /// Requesting data from the URL using a GET method
        func asURLRequest() throws -> URLRequest {
            let URL = Foundation.URL(string: "http://www.recipepuppy.com/api")!
            var request = URLRequest(url: URL.appendingPathComponent(path))
            request.httpMethod = HTTPMethod.get.rawValue
            print("Request \(request)")
            return try URLEncoding().encode(request, with: [:])
       }
    }
    
    // MARK: - Network Results
    
    /// Requesting the recipes from the router to receive the image and title data. Using @escaping to allow the Puppy parameter to last after the function is executed.
    class func getResults(completion: @escaping([Puppy]) -> Void) {
        Alamofire.request(Router.getResults).validate().responseJSON {
            response in
            print(response)
            
            guard let value = response.result.value else {
                print("ERROR: No Response")
                return
            }
            
            let recipes = JSON(value)[ResultString.Result].arrayValue.compactMap({ Puppy(data: $0) })
            completion(recipes)
        }
    }
}

