//
//  Don'twanttoSleepViewController.swift
//  OriginalApp3
//
//  Created by 冨田柚香 on 2021/01/10.
//

import UIKit
import AVFoundation

class Don_twanttoSleepViewController: UIViewController {
    
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet var judgeImageView: UIImageView!
    @IBOutlet weak var MamechishikiLabel: UILabel!
    
    let labels = ["尻尾が長いと不衛生だから長くなる前に切ってしまう。","メスは何年かにわたって子供を生んでその間に毛を刈られる。","羊は草食動物である。","羊には胃袋が４つあり、ちなみに牛も同じである。","桜が咲く頃に行われる。","一度に１〜２頭の子供を産む。","日本で飼われている羊のほとんどがサフォーク種であり、頭、前足、後足が黒いのが特徴である。","びっくりだね","羊の日本への伝来は推古天皇７年（５９９年）に百済より２頭献上されたので最も古い記録と言われている。","浮世絵の羊は髭と角があることが多い。昔は羊は想像するしかなかった生き物だったのである。","ドイツ語で羊はシャーフである。シュラーフはドイツ語で睡眠である。","正解は中国である。食肉用として飼育されている数が多いのである。","羊の寿命は１０〜１２年である。","危険があるとすぐにパニックを起こしてしまうのである。","羊は視野が広い。離れた目と横長の瞳孔を持ち、視野は270－320°といわれている。"]
    
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
        
        csvArray = loadCSV(filename: "quiz")
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
        let scoreVC = segue.destination as! ScoreViewController
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
