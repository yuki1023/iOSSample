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
        
        tenki()
//        yoho(searchWord: "chiba")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
        
        if let searchWord = searchBar.text {
            yoho(searchWord: searchWord)
        }
    }
    
    struct Description: Codable {
        
        let description: String?
    }
    struct Weather: Codable {
        let weather: [Description]?
    }
    
    func yoho(searchWord: String) {
        let text = "https://api.openweathermap.org/data/2.5/weather?q=\(searchWord)&units=metric&appid=983d576f797832c1307eee8343f859b1"
        
        let url = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
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
                
                print(json["main"]["temp_max"].number?.stringValue)
                
                self.max.text = "\(json["main"]["temp_max"].number!.stringValue)℃"
                
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    func tenki () {
        //encorde
        let text = "https://api.openweathermap.org/data/2.5/weather?q=chiba&units=metric&appid=983d576f797832c1307eee8343f859b1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let request = URLRequest(url: URL(string: text!)!)
        
        print(request)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                
                do {
                    //decorde
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

