//
//  resultController.swift
//  RandomTrip
//
//  Created by Ishii Yugo on 2018/08/28.
//  Copyright © 2018年 yugo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class resultController: UIViewController {

    
    @IBOutlet weak var prefectureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
   // var city: City
    
    var apiToContact = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // let numberOfMovies = 25
      //let prefectureNumber = arc4random_uniform(47)+1
        //1-47ランダムで定数に入れる
       // let apiToContact = "https://itunes.apple.com/us/rss/topmovies/limit=\(numberOfMovies)/json"
       // let color:rgba = UIcolor(red:1.0,green:0.0,blue:0.0,alpha:1.0)
        //self.prefectureLabel.textColor = color
        var preCode = Int(arc4random_uniform(47))+1
        var prefectureName = Prefecture()
        //prefectureName = prefecture[precode].name
        
        self.prefectureLabel.font = UIFont(name: "HarenosoraMincho" , size: 45)
        self.prefectureLabel.text = prefectureName.prefecture[preCode]! + "の"
        
   if (preCode >= 1 && preCode <= 9){
//         var preCodeString:String = "0" + String(preCode)
           apiToContact = "http://www.land.mlit.go.jp/webland/api/CitySearch?area=0\(preCode)"
     } else {
            apiToContact = "http://www.land.mlit.go.jp/webland/api/CitySearch?area=\(preCode)"
    }
        //let apiToContact = "http://www.land.mlit.go.jp/webland/api/CitySearch?area=\(preCode)"
        //市町村APIを持ってくる
        
        // This code will call the iTunes top 25 movies endpoint listed above
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    // Do what you need to with JSON here!
                    // The rest is all boiler plate code you'll use for API requests
                    //自分で定義する
               
                    
                   // var cityArray:[City]
                  //  let prefectureName: String
                    let cityName: String
                    
                    var cityArray = json["data"].arrayValue
                    var cityNumber = cityArray.count
                    var cityRandomNumber = arc4random_uniform(UInt32(cityNumber))
                    
                 cityName = json["data"][Int(cityRandomNumber)]["name"].stringValue
                   
                    self.cityLabel.font = UIFont(name: "HarenosoraMincho" , size: 45)
                    self.cityLabel.text = cityName + "です。"
//                        cityArray = json["data"].arrayValue
//                        cityNumber = cityArray.count
//                    cityName = json["data"][arc4random_uniform(UInt32(cityNumber))]["name"].stringValue
                        // self.prefectureName = json[]
//                    print(cityArray)
                }
            case .failure(let error):
                //self.cityLabel.text = error.localizedDescription
                print(error)
            }
        }

        // Do any additional setup after loading the view.
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
