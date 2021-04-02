//
//  TopScreenViewController.swift
//  OriginalApp3
//
//  Created by 冨田柚香 on 2021/01/10.
//

import UIKit

class TopScreenViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var gifImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 表示したい画像の名前(拡張子含む)を引数とする。
        self.view.addBackground(name: "ひつじちゃん")
    }
    
    override func viewDidLayoutSubviews() {
        self.button1.layer.cornerRadius = 10.0
        self.button2.layer.cornerRadius = 10.0
        self.button3.layer.cornerRadius = 10.0
        self.myLabel.layer.cornerRadius = 10.0
        self.myLabel.clipsToBounds = true
    }
        
            
        }
        
      
    

  


