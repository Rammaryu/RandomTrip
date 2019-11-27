//
//  City.swift
//  RandomTrip
//
//  Created by Ishii Yugo on 2018/08/28.
//  Copyright © 2018年 yugo. All rights reserved.
//

import Foundation
import SwiftyJSON


class City{
    var id:String = ""
    var name:String = ""
}


//struct City {
//    var cityNumber: Int
//    var cityArray:[Dictionary<String,String>]
//    let prefectureName: String
//    let cityName: String
//    
//    init(json: JSON) {
//        self.cityArray = json["data"].arrayValue
//        self.cityNumber = self.cityArray.count
//        self.cityName = json["data"][arc4random_uniform(UInt32(cityNumber))+1]["name"].stringValue
//       // self.prefectureName = json[]
//        
//    }
//    
//}
