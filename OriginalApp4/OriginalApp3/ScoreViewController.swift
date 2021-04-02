//
//  ScoreViewController.swift
//  OriginalApp3
//
//  Created by 冨田柚香 on 2021/01/15.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet var ScoreLabel: UILabel!
    @IBOutlet var Label: UILabel!
    @IBOutlet var BackButton: UIButton!
    @IBOutlet var SleepingButton: UIButton!
    
    var correct = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // 表示したい画像の名前(拡張子含む)を引数とする。
        self.view.addBackground(name: "ひつじちゃん")
        
        ScoreLabel.text = "\(correct)問正解!"

        // Do any additional setup after loading the view.
    }
   
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)

    
}
    
    override func viewDidLayoutSubviews() {
        self.BackButton.layer.cornerRadius = 10.0
        self.SleepingButton.layer.cornerRadius = 10.0
        self.ScoreLabel.layer.cornerRadius = 10.0
        self.Label.layer.cornerRadius = 10.0
        self.Label.clipsToBounds = true
        self.ScoreLabel.clipsToBounds = true
        
}
}
