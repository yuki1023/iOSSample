//
//  CannotSleepViewController.swift
//  OriginalApp3
//
//  Created by 冨田柚香 on 2021/01/10.
//

import UIKit
import AVFoundation

class CannotSleepViewController: UIViewController {

    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet var judgeImageView: UIImageView!
    @IBOutlet weak var MamechishikiLabel: UILabel!
    
    let labels = ["１０分以内には見ていた夢の実に９０％を忘れてしまう。","何も食べずに2週間が経過すると餓死するが、１０日間眠らない場合でも死に至る。","２組に１組ではなく、４組に１組である。","びっくり！","２５％ではなく、１２％である。","コアラは１日に２２時間も寝る。","残り半分は起きていて、呼吸のサイクルを助けている。","３０代の男性ではなく、１０代の青少年である。","びっくり！","レム睡眠ではなくノンレム睡眠が脳が休息して筋肉は活動してる状態であり、ジェットコースターでいえば一気に下る時である。","ジェットコースターで言えば、カタカタと頂上目指し上っている状態のことである。","１２時ではなく、１１時頃眠りはじめると一番効率よく成長ホルモンがゲットできる。","寝具の温度は３３度、湿度は５０％。これが眠りの黄金比率である。","びっくり！","人は入眠準備として体温を下げることで休息状態に入っていく。入浴して体の深部を温めておくことで、この体温調整が促され、スムーズに眠りに入ることができる。"]
    
    var tapCount = 0
    
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    
    var audioPlayerInstance1 : AVAudioPlayer! = nil
    var audioPlayerInstance2 : AVAudioPlayer! = nil
    // 再生するサウンドのインスタンス
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // サウンドファイルのパスを生成(今回のファイルに導入した画像ファイル名を書きます)
                let soundFilePath1 = Bundle.main.path(forResource: "効果音１", ofType: "mp3")!
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
        
        // サウンドファイルのパスを生成(今回のファイルに導入した画像ファイル名を書きます)
                let soundFilePath2 = Bundle.main.path(forResource: "効果音２", ofType: "mp3")!
        let sound2:URL = URL(fileURLWithPath: soundFilePath2)
                // AVAudioPlayerのインスタンスを作成,ファイルの読み込み
                do {
                    audioPlayerInstance2 = try AVAudioPlayer(contentsOf: sound2, fileTypeHint:nil)
                } catch {
                    print("AVAudioPlayerインスタンス作成でエラー")
                }
                // 再生準備
        audioPlayerInstance2.prepareToPlay()
                // Do any additional setup after loading the view, typically from a nib.
        
        // 表示したい画像の名前(拡張子含む)を引数とする。
        self.view.addBackground(name: "ひつじちゃん")
        
        csvArray = loadCSV(filename: "quiz2")
        print(csvArray)
        
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        
        //Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        self.answerButton1.layer.cornerRadius = 10.0
        self.answerButton2.layer.cornerRadius = 10.0
        self.quizNumberLabel.layer.cornerRadius = 10.0
        self.quizNumberLabel.clipsToBounds = true
        self.quizTextView.layer.cornerRadius = 10.0
        self.MamechishikiLabel.layer.cornerRadius = 10.0
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! Score2ViewController
        scoreVC.correct = correctCount
        
    }
    
    //ボタンを押したときに呼ばれる
    @IBAction func btnAction(sender: UIButton) {
        MamechishikiLabel.text = labels[tapCount % labels.count]
                tapCount += 1
        if sender.tag == Int(quizArray[1]) {
            correctCount += 1
            print("正解")
            judgeImageView.image = UIImage(named: "correct")
        } else {
            print("不正解")
            judgeImageView.image = UIImage(named: "incorrect")
        }
    print("スコア：\(correctCount)")
    judgeImageView.isHidden = false
    answerButton1.isEnabled = false
    answerButton2.isEnabled = false
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
    self.judgeImageView.isHidden = true
    self.answerButton1.isEnabled = true
    self.answerButton2.isEnabled = true
    self.nextQuiz()
        }
    }
    
    @IBAction func sound1(_ sender: UIButton) {
        // 連打した時に連続して音がなるようにする
        audioPlayerInstance1.currentTime = 0         // 再生箇所を頭に移す
        audioPlayerInstance1.play()                  // 再生する

    }
     
     @IBAction func sound2(_ sender: UIButton) {
         // 連打した時に連続して音がなるようにする
         audioPlayerInstance2.currentTime = 0         // 再生箇所を頭に移す
         audioPlayerInstance2.play()                  // 再生する

     }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextQuiz() {
        quizCount += 1
        if quizCount < csvArray.count {
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            quizNumberLabel.text = "第\(quizCount + 1)問"
            quizTextView.text = quizArray[0]
            answerButton1.setTitle(quizArray[2], for: .normal)
            answerButton2.setTitle(quizArray[3], for: .normal)
        } else {
            performSegue(withIdentifier: "toScoreVC", sender: nil)
        }
    }
    
    func loadCSV(filename: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: filename, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
    }


    



}
