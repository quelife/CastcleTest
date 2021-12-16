//
//  CountryViewModel.swift
//  CastcleTest
//
//  Created by que on 16/12/2564 BE.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftyJSON
import Alamofire

class CountryViewModel {
    
    private let disposeBag = DisposeBag()
    
    var payload: [Payload] = []
    var countryStringName: [String] = []
    
    public let CountrySubject : PublishSubject<String?> = PublishSubject()
            
    public func getCountry() {
        AppAPI.getCountry() { (response) in
            if let json = response.data {
                self.countryStringName.removeAll()
                let data = Country(withJSON: json)
                self.payload = data.payload
                for item in self.payload {
                    self.countryStringName.append(item.name)
                }
                self.CountrySubject.onNext(nil)
            }else {
                self.CountrySubject.onNext(nil)
            }
        }
    }
}

