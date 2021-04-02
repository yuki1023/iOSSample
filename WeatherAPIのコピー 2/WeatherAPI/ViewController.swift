//
//  ViewController.swift
//  WeatherAPI
//
//  Created by 小泉竣太郎 on 2020/08/27.
//  Copyright © 2020 shuntaro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tenkiImageView: UIImageView!
    @IBOutlet var max: UILabel!
    @IBOutlet var min: UILabel!
    @IBOutlet var taikan: UILabel!
    @IBOutlet var humidity: UILabel!
    @IBOutlet var wind: UILabel!

    var aaaa: String?
    
    var descriptionWeather: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.placeholder = "都市名を入力してください"
        
//        tenki()
        yoho(searchWord: "chiba")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
        
        if let searchWord = searchBar.text {
            yoho(searchWord: searchWord)
        }
    }
    
    //データを受け取る形を作る
    struct Description: Codable {
        
        let description: String?
    }
    struct Weather: Codable {
        let weather: [Description]?
    }
    
    //やり方①　AlamofireとSwiftyJSONっていうライブラリを使うやり方
    func yoho(searchWord: String) {
        //リクエストのためのURLを""のなかに書こう！
        let text = ""
        //エンコード
        let url = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        //リクエスト
        AF.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result {
            case .success:
                //デコード
                let json = JSON(response.data as Any)
                print(json)
                //swiftyjson
                self.descriptionWeather = json["weather"][0]["main"].string!
                
                if self.descriptionWeather == "Clouds" {
                    print("曇り")
                    self.tenkiImageView.image = UIImage(named: "kumori")
                }else if self.descriptionWeather == "Rain" {
                    print("雨")
                    self.tenkiImageView.image = UIImage(named: "ame")
                }else{
                    print("晴れ")
                    self.tenkiImageView.image = UIImage(named: "hare")
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    //やり方②　ライブラリを使わないやり方
    func tenki () {
        //エンコード
        //リクエストのためのURLを""のなかに書こう！
        let text = "".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let request = URLRequest(url: URL(string: text!)!)
        
        print(request)
        
        let session = URLSession.shared
        //リクエスト
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                
                do {
                    //デコード
                    let decorder = JSONDecoder()
                    let json = try decorder.decode(Weather.self, from: data!)
                    print(json)
                    
                    if let description = json.weather?[0].description {
                        print(description, "description")
                    }
                    
                } catch {
                    print("error")
                }
            }
        })
        
        dataTask.resume()
    }
    
}

