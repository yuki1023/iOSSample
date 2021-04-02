//
//  SheepViewController.swift
//  OriginalApp3
//
//  Created by 冨田柚香 on 2021/01/10.
//

import UIKit
import SwiftGifOrigin

class SheepViewController: UIViewController {

    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var gifImage2: UIImageView!
    @IBOutlet weak var gifImage3: UIImageView!
    @IBOutlet weak var gifImage4: UIImageView!
    @IBOutlet weak var gifImage5: UIImageView!
    @IBOutlet weak var gifImage6: UIImageView!
    @IBOutlet weak var gifImage7: UIImageView!
    @IBOutlet weak var gifImage8: UIImageView!
    @IBOutlet weak var gifImage9: UIImageView!
    @IBOutlet weak var gifImage10: UIImageView!
    @IBOutlet weak var gifImage11: UIImageView!
    @IBOutlet weak var gifImage12: UIImageView!
    @IBOutlet weak var gifImage13: UIImageView!
    @IBOutlet weak var gifImage14: UIImageView!
    @IBOutlet weak var gifImage15: UIImageView!
    @IBOutlet weak var PushButton: UIButton!
    @IBOutlet weak var SleepingButton: UIButton!
    @IBOutlet weak var Label: UILabel!
    
    //    private var isLeft: Bool = true    //  キャラが左を向いているかどうかのフラグ
    private var isLeft: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft2: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage2.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage2.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft3: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage3.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage3.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft4: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage4.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage4.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft5: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage5.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage5.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft6: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage6.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage6.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft7: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage7.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage7.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft8: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage8.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage8.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft9: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage9.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage9.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft10: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage10.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage10.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft11: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage11.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage11.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft12: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage12.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage12.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft13: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage13.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage13.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft14: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage14.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage14.transform = CGAffineTransform(scaleX: -1 , y: 1)
            }
        }
    }
    private var isLeft15: Bool = true {
        willSet(newValue) {
            // 新しい値がtrueだったら正しい方向に、falseだったら反転させる
            if newValue {
                gifImage15.transform = CGAffineTransform(scaleX: 1 , y: 1)
            } else {
                gifImage15.transform = CGAffineTransform(scaleX: -1 , y: 1)
                
            }
            }
    }
    private var timer = Timer()  // Timerの宣言
    private var timer2 = Timer()
    private var timer3 = Timer()
    private var timer4 = Timer()
    private var timer5 = Timer()
    private var timer6 = Timer()
    private var timer7 = Timer()
    private var timer8 = Timer()
    private var timer9 = Timer()
    private var timer10 = Timer()
    private var timer11 = Timer()
    private var timer12 = Timer()
    private var timer13 = Timer()
    private var timer14 = Timer()
    private var timer15 = Timer()
    
    var number : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 230/255, green: 255/255, blue: 230/255, alpha: 90/100)
        
        self.count()
       
    }
    
    override func viewDidLayoutSubviews() {
        self.PushButton.layer.cornerRadius = 10.0
        self.SleepingButton.layer.cornerRadius = 10.0
        self.Label.layer.cornerRadius = 10.0
        self.Label.clipsToBounds = true
        
    }
    @objc func move(_ timer: Timer) {
        // キャラ画像のframeを変数に格納
        var frame = gifImage.frame
        // 移動量を定義して変数に格納
        let moveX: CGFloat = 50.0
        // 画面の左端(x座標が0)に到達したら
        if frame.origin.x < 0 {
            // 右を向くことを表すためにフラグをfalseにする
            isLeft = false
            // 右を向いたら反転させる
            gifImage.transform = CGAffineTransform(scaleX: -1 , y: 1)
            // もしキャラのx座標が右端(画面の最大x座標 - imageViewのサイズ分)に到達したら
        } else if frame.origin.x > view.frame.maxX - gifImage.frame.width {
            // 左を向くことを表すためにフラグをtrueにする
            isLeft = true
            // 左を向いたら正しい方向にする
            gifImage.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        // 左を向いていれば左に動かすためにx軸の値をマイナス、逆ならプラスする
        isLeft ? (frame.origin.x -= moveX) : (frame.origin.x += moveX)
        // imageViewのframeに代入
        gifImage.frame = frame
    }
    @objc func move2(_ timer2: Timer) {
        var frame2 = gifImage2.frame
        let moveX: CGFloat = 50.0
        if frame2.origin.x < 0 {
            isLeft2 = false
            gifImage2.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame2.origin.x > view.frame.maxX - gifImage2.frame.width {
            isLeft2 = true
            gifImage2.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft2 ? (frame2.origin.x -= moveX) : (frame2.origin.x += moveX)
        gifImage2.frame = frame2
    }
    @objc func move3(_ timer3: Timer) {
        var frame3 = gifImage3.frame
        let moveX: CGFloat = 50.0
        if frame3.origin.x < 0 {
            isLeft3 = false
            gifImage3.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame3.origin.x > view.frame.maxX - gifImage3.frame.width {
            isLeft3 = true
            gifImage3.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft3 ? (frame3.origin.x -= moveX) : (frame3.origin.x += moveX)
        gifImage3.frame = frame3
    }
    @objc func move4(_ timer4: Timer) {
        var frame4 = gifImage4.frame
        let moveX: CGFloat = 50.0
        if frame4.origin.x < 0 {
            isLeft4 = false
            gifImage4.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame4.origin.x > view.frame.maxX - gifImage4.frame.width {
            isLeft4 = true
            gifImage4.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft4 ? (frame4.origin.x -= moveX) : (frame4.origin.x += moveX)
        gifImage4.frame = frame4
    }
    @objc func move5(_ timer5: Timer) {
        var frame5 = gifImage5.frame
        let moveX: CGFloat = 50.0
        if frame5.origin.x < 0 {
            isLeft5 = false
            gifImage5.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame5.origin.x > view.frame.maxX - gifImage5.frame.width {
            isLeft5 = true
            gifImage5.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft5 ? (frame5.origin.x -= moveX) : (frame5.origin.x += moveX)
        gifImage5.frame = frame5
    }
    @objc func move6(_ timer6: Timer) {
        var frame6 = gifImage6.frame
        let moveX: CGFloat = 50.0
        if frame6.origin.x < 0 {
            isLeft6 = false
            gifImage6.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame6.origin.x > view.frame.maxX - gifImage6.frame.width {
            isLeft6 = true
            gifImage6.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft6 ? (frame6.origin.x -= moveX) : (frame6.origin.x += moveX)
        gifImage6.frame = frame6
    }
    @objc func move7(_ timer7: Timer) {
        var frame7 = gifImage7.frame
        let moveX: CGFloat = 50.0
        if frame7.origin.x < 0 {
            isLeft7 = false
            gifImage7.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame7.origin.x > view.frame.maxX - gifImage7.frame.width {
            isLeft7 = true
            gifImage7.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft7 ? (frame7.origin.x -= moveX) : (frame7.origin.x += moveX)
        gifImage7.frame = frame7
    }
    @objc func move8(_ timer8: Timer) {
        var frame8 = gifImage8.frame
        let moveX: CGFloat = 50.0
        if frame8.origin.x < 0 {
            isLeft8 = false
            gifImage8.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame8.origin.x > view.frame.maxX - gifImage8.frame.width {
            isLeft8 = true
            gifImage8.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft8 ? (frame8.origin.x -= moveX) : (frame8.origin.x += moveX)
        gifImage8.frame = frame8
    }
    @objc func move9(_ timer9: Timer) {
        var frame9 = gifImage9.frame
        let moveX: CGFloat = 50.0
        if frame9.origin.x < 0 {
            isLeft9 = false
            gifImage9.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame9.origin.x > view.frame.maxX - gifImage9.frame.width {
            isLeft9 = true
            gifImage9.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft9 ? (frame9.origin.x -= moveX) : (frame9.origin.x += moveX)
        gifImage9.frame = frame9
    }
    @objc func move10(_ timer10: Timer) {
        var frame10 = gifImage10.frame
        let moveX: CGFloat = 50.0
        if frame10.origin.x < 0 {
            isLeft10 = false
            gifImage10.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame10.origin.x > view.frame.maxX - gifImage10.frame.width {
            isLeft10 = true
            gifImage10.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft10 ? (frame10.origin.x -= moveX) : (frame10.origin.x += moveX)
        gifImage10.frame = frame10
    }
    @objc func move11(_ timer11: Timer) {
        var frame11 = gifImage11.frame
        let moveX: CGFloat = 50.0
        if frame11.origin.x < 0 {
            isLeft11 = false
            gifImage11.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame11.origin.x > view.frame.maxX - gifImage11.frame.width {
            isLeft11 = true
            gifImage11.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft11 ? (frame11.origin.x -= moveX) : (frame11.origin.x += moveX)
        gifImage11.frame = frame11
    }
    @objc func move12(_ timer12: Timer) {
        var frame12 = gifImage12.frame
        let moveX: CGFloat = 50.0
        if frame12.origin.x < 0 {
            isLeft12 = false
            gifImage12.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame12.origin.x > view.frame.maxX - gifImage12.frame.width {
            isLeft12 = true
            gifImage12.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft12 ? (frame12.origin.x -= moveX) : (frame12.origin.x += moveX)
        gifImage12.frame = frame12
    }
    @objc func move13(_ timer13: Timer) {
        var frame13 = gifImage13.frame
        let moveX: CGFloat = 50.0
        if frame13.origin.x < 0 {
            isLeft13 = false
            gifImage13.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame13.origin.x > view.frame.maxX - gifImage13.frame.width {
            isLeft13 = true
            gifImage13.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft13 ? (frame13.origin.x -= moveX) : (frame13.origin.x += moveX)
        gifImage13.frame = frame13
    }
    @objc func move14(_ timer14: Timer) {
        var frame14 = gifImage14.frame
        let moveX: CGFloat = 50.0
        if frame14.origin.x < 0 {
            isLeft14 = false
            gifImage14.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame14.origin.x > view.frame.maxX - gifImage14.frame.width {
            isLeft14 = true
            gifImage4.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft14 ? (frame14.origin.x -= moveX) : (frame14.origin.x += moveX)
        gifImage14.frame = frame14
    }
    @objc func move15(_ timer15: Timer) {
        var frame15 = gifImage15.frame
        let moveX: CGFloat = 50.0
        if frame15.origin.x < 0 {
            isLeft15 = false
            gifImage15.transform = CGAffineTransform(scaleX: -1 , y: 1)
        } else if frame15.origin.x > view.frame.maxX - gifImage15.frame.width {
            isLeft15 = true
            gifImage15.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
        isLeft15 ? (frame15.origin.x -= moveX) : (frame15.origin.x += moveX)
        gifImage15.frame = frame15
    }
    var num: Int = 0
    
   
    @IBAction func plus(){
        self.num = self.num + 1
        print(self.num)
        self.count()
        
    }
    
    func count(){
        
        switch self.num{
//                    case 1:
//
        case 1:
            //loadGifメソッドを追記し、引数としてGIFファイル名を与える
            self.gifImage.loadGif(name: "sheepy")
            self.gifImage.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage.topAnchor.constraint(equalTo: self.gifImage15.bottomAnchor, constant: 66).isActive = true
            self.gifImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
            self.timer.fire()
        case 2:
            self.gifImage2.loadGif(name: "sheepy2")
            self.gifImage2.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage2.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage2.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage2.topAnchor.constraint(equalTo: self.gifImage.bottomAnchor, constant: 83).isActive = true
            self.gifImage2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
            self.timer2 = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(self.move2(_:)), userInfo: nil, repeats: true)
            self.timer2.fire()
        case 3:
            self.gifImage3.loadGif(name: "sheepy3")
            self.gifImage3.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage3.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage3.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage3.leadingAnchor.constraint(equalTo: self.gifImage11.trailingAnchor, constant: 21).isActive = true
            self.timer3 = Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(self.move3(_:)), userInfo: nil, repeats: true)
            self.timer3.fire()
        case 4:
            self.gifImage4.loadGif(name: "sheepy4")
            self.gifImage4.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage4.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage4.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage4.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 69).isActive = true
            self.timer4 = Timer.scheduledTimer(timeInterval: 1.3, target: self, selector: #selector(self.move4(_:)), userInfo: nil, repeats: true)
            self.timer4.fire()
        case 5:
            self.gifImage5.loadGif(name: "sheepy5")
            self.gifImage5.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage5.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage5.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage5.leadingAnchor.constraint(equalTo: self.gifImage2.trailingAnchor, constant: 56).isActive = true
            self.timer5 = Timer.scheduledTimer(timeInterval: 14, target: self, selector: #selector(self.move5(_:)), userInfo: nil, repeats: true)
            self.timer5.fire()
        case 6:
            self.gifImage6.loadGif(name: "sheepy6")
            self.gifImage6.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage6.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage6.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage6.topAnchor.constraint(equalTo: self.gifImage.bottomAnchor, constant: 17).isActive = true
            self.gifImage6.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60).isActive = true
            self.timer6 = Timer.scheduledTimer(timeInterval: 1.45, target: self, selector: #selector(self.move6(_:)), userInfo: nil, repeats: true)
            self.timer6.fire()
        case 7:
            self.gifImage7.loadGif(name: "sheepy7")
            self.gifImage7.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage7.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage7.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage7.leadingAnchor.constraint(equalTo: self.gifImage5.leadingAnchor, constant: 21).isActive = true
            self.timer7 = Timer.scheduledTimer(timeInterval: 1.35, target: self, selector: #selector(self.move7(_:)), userInfo: nil, repeats: true)
            self.timer7.fire()
        case 8:
            self.gifImage8.loadGif(name: "sheepy8")
            self.gifImage8.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage8.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage8.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage8.topAnchor.constraint(equalTo: self.gifImage12.bottomAnchor, constant: 21).isActive = true
            self.gifImage8.leadingAnchor.constraint(equalTo: self.gifImage11.leadingAnchor, constant: 45).isActive = true
            self.timer8 = Timer.scheduledTimer(timeInterval: 1.25, target: self, selector: #selector(self.move8(_:)), userInfo: nil, repeats: true)
            self.timer8.fire()
        case 9:
            self.gifImage9.loadGif(name: "sheepy9")
            self.gifImage9.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage9.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage9.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage9.leadingAnchor.constraint(equalTo: self.gifImage4.leadingAnchor, constant: 8).isActive = true
            self.timer9 = Timer.scheduledTimer(timeInterval: 1.15, target: self, selector: #selector(self.move9(_:)), userInfo: nil, repeats: true)
            self.timer9.fire()
        case 10:
            self.gifImage11.loadGif(name: "sheepy10")
            self.gifImage11.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage11.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.251).isActive = true
            self.gifImage11.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.211).isActive = true
            self.gifImage11.leadingAnchor.constraint(equalTo: self.gifImage14.trailingAnchor, constant: 36).isActive = true
            self.gifImage.removeFromSuperview()
            self.gifImage2.removeFromSuperview()
            self.gifImage3.removeFromSuperview()
            self.gifImage4.removeFromSuperview()
            self.gifImage5.removeFromSuperview()
            self.gifImage6.removeFromSuperview()
            self.gifImage7.removeFromSuperview()
            self.gifImage8.removeFromSuperview()
            self.gifImage9.removeFromSuperview()
            self.timer11 = Timer.scheduledTimer(timeInterval: 1.05, target: self, selector: #selector(self.move11(_:)), userInfo: nil, repeats: true)
            self.timer11.fire()
        case 11:
            self.timer.invalidate()
            self.view.addSubview(self.gifImage)
            self.gifImage.loadGif(name: "sheepy11")
            self.gifImage.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.move(_:)), userInfo: nil, repeats: true)
            self.timer.fire()
        case 12:
            self.timer2.invalidate()
            self.view.addSubview(self.gifImage2)
            self.gifImage2.loadGif(name: "sheepy12")
            self.gifImage2.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage2.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage2.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage2.topAnchor.constraint(equalTo: self.gifImage.bottomAnchor, constant: 83).isActive = true
            self.gifImage2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
            self.timer2 = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(self.move2(_:)), userInfo: nil, repeats: true)
            self.timer2.fire()
        case 13:
            self.timer3.invalidate()
            self.view.addSubview(self.gifImage3)
            self.gifImage3.loadGif(name: "sheepy13")
            self.gifImage3.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage3.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage3.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage3.leadingAnchor.constraint(equalTo: self.gifImage11.trailingAnchor, constant: 21).isActive = true
            self.timer3 = Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(self.move3(_:)), userInfo: nil, repeats: true)
            self.timer3.fire()
        case 14:
            self.timer4.invalidate()
            self.view.addSubview(self.gifImage4)
            self.gifImage4.loadGif(name: "sheepy14")
            self.gifImage4.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage4.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage4.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage4.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 69).isActive = true
            self.timer4 = Timer.scheduledTimer(timeInterval: 1.3, target: self, selector: #selector(self.move4(_:)), userInfo: nil, repeats: true)
            self.timer4.fire()
        case 15:
            self.timer4.fire()
            self.timer5.invalidate()
            self.view.addSubview(self.gifImage5)
            self.gifImage5.loadGif(name: "sheepy15")
            self.gifImage5.translatesAutoresizingMaskIntoConstraints = false
            self.gifImage5.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.16).isActive = true
            self.gifImage5.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.135).isActive = true
            self.gifImage5.leadingAnchor.constraint(equalTo: self.gifImage2.trailingAnchor, constant: 56).isActive = true
            self.timer5 = Timer.scheduledTimer(timeInterval: 1.4, target: self, selector: #selector(self.move5(_:)), userInfo: nil, repeats: true)
            self.timer5.fire()
       
        default:break
        }
    }
}







   




