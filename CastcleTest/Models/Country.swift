//
//  Country.swift
//  CastcleTest
//
//  Created by que on 16/12/2564 BE.
//

import SwiftyJSON

class Country: NSObject {
    
    var payload: [Payload] = []
    
    
    init(withJSON json: JSON) {
        super.init()
        parseData(withJSON: json)
    }
    
    func parseData(withJSON json: JSON) {
        payload = json["payload"].arrayValue.compactMap { Payload(fromJson: $0) }
    }

}

class Payload: NSObject {
    
    var code: String = ""
    var dialCode: String = ""
    var name: String = ""
    var flag: String = ""
    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        flag = json["flag"].stringValue
        name = json["name"].stringValue
        dialCode = json["dialCode"].stringValue
        code = json["code"].stringValue
    }
}

