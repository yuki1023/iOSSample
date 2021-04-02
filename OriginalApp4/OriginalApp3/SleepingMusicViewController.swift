//
//  SleepingMusicViewController.swift
//  OriginalApp3
//
//  Created by 冨田柚香 on 2021/01/19.
//

import UIKit
import AVFoundation

class SleepingMusicViewController: UIViewController {
    
    @IBOutlet weak var MusicOnButton1: UIButton!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var Label: UILabel!

    var audioPlayerInstance1 : AVAudioPlayer! = nil
        // 再生するサウンドのインスタンス
    
    @IBAction func sound1(_ sender: UIButton) {
        // 連打した時に連続して音がなるようにする
        audioPlayerInstance1.currentTime = 0         // 再生箇所を頭に移す
        audioPlayerInstance1.play()                  // 再生する
    
    }

       // 停止ボタン
       @IBAction func StopButton(sender: AnyObject) {

        audioPlayerInstance1.stop()
       }

       
    override func viewDidLoad() {
        super.viewDidLoad()
        // サウンドファイルのパスを生成(今回のファイルに導入した画像ファイル名を書きます)
                let soundFilePath1 = Bundle.main.path(forResource: "Music1", ofType: "mp3")!
        let sound1:URL = URL(fileURLWithPath: soundFilePath1)
                // AVAudioPlayerのインスタンスを作成,ファイルの読み込み
                do {
                    audioPlayerInstance1 = try AVAudioPlayer(contentsOf: sound1, fileTypeHint:nil)
                } catch {
                    print("AVAudioPlayerインスタンス作成でエラー")
                }
                // 再生準備
        audioPlayerInstance1.prepareToPlay()
                // Do any additional setup after loading the view, typically from a nib.
        
        // 表示したい画像の名前(拡張子含む)を引数とする。
        self.view.addBackground(name: "ひつじちゃん")

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        self.MusicOnButton1.layer.cornerRadius = 10.0
        self.StartButton.layer.cornerRadius = 10.0
        self.StopButton.layer.cornerRadius = 10.0
        self.Label.layer.cornerRadius = 10.0
        self.Label.clipsToBounds = true
   
}


}
