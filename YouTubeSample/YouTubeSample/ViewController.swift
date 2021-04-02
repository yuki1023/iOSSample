//
//  ViewController.swift
//  YouTubeSample
//
//  Created by 土橋展之 on 2021/02/27.
//

import UIKit
import youtube_ios_player_helper
import SwiftyJSON
import Alamofire
import Photos
import SDWebImage

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var idArray = [""]
    
    @IBOutlet weak var selectTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectTableView.delegate = self
        selectTableView.dataSource = self
        
        let youtubeView = YTPlayerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 240))
        youtubeView.load(withVideoId: "lrWWxUvfsrI")
        youtubeView.delegate = self
        view.addSubview(youtubeView)

        selectTableView.rowHeight = 150
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let thumbnailsView = cell.viewWithTag(1) as! UIImageView
        let titleLabel = cell.viewWithTag(2) as! UITextView
        
//        let url =
//         "https://www.googleapis.com/youtube/v3/search?key=AIzaSyAlAohT5J0sEDsunhM5PiG2kNJG2vUHqfI&q=錦織圭&part=snippet&maxResults=40&order=viewCount"
        
        
        //リクエストURL作成。自分のapikeyを使用すること！
        let url =
         "https://www.googleapis.com/youtube/v3/search?key=AIzaSyAIhRTYHrzphQlc8tXdpWciemV7Y5zehJ4&q=ポケモン&part=snippet&maxResults=5&order=viewCount"
         
        let count = indexPath.row
        
        
         AF.request(url,method: .get,parameters: nil, encoding:JSONEncoding.default).responseJSON { (response) in
             
             switch response.result{
             
             case .success:
                 
                 
                 let json:JSON = JSON(response.data as Any)
                 let imageString = json["items"][count]["snippet"]["title"].string
                 let thumbnails = json["items"][count]["snippet"]["thumbnails"]["default"]["url"].string
                
                //videoIdを取得してみよう！
                 let videoId = json["items"][count]["id"]["videoid"].string
                
                print(imageString as Any)
                print(thumbnails)
                print(videoId as Any)
                print("----------")
                self.idArray.append(videoId!)
                 
                thumbnailsView.sd_setImage(with: URL(string: thumbnails!), completed: nil)
                
                titleLabel.text = imageString
                
             case .failure(let error):
                 
             print(error)
             print("error")
             
             }
            
           
    }
        return cell
   
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //何番目をタップしたかを入れている
        let selectedIndex = selectTableView.indexPathForSelectedRow!
        let youtubeView = YTPlayerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 240))
        youtubeView.delegate = self
        view.addSubview(youtubeView)

        youtubeView.load(withVideoId: idArray[indexPath.row])
    }

}


extension ViewController: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) { playerView.playVideo() }
}
