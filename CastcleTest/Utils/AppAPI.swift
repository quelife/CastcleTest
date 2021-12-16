//
//  AppAPI.swift
//  CastcleTest
//
//  Created by que on 16/12/2564 BE.
//

import Alamofire
import SwiftyJSON

class AppAPI: NSObject {
    @discardableResult class func getCountry(completion: APICompletion? ) -> APIRequest {
        
        let request = APIRequest()
        
        request.url = URL(string: "https://api-dev.castcle.com/metadata/country?sortBy=asc(name)")!
        request.method = .get
        request.completion = completion
        
        request.request()
        
        return request
    }
}

