//
//  saveViewController.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/11.
//

import UIKit

class saveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //　ナビゲーションバーの背景色
    self.navigationController?.navigationBar.barTintColor = .darkGray
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
    self.navigationController?.navigationBar.tintColor = .systemYellow
        // ナビゲーションバーのテキストを変更する
    self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
                .foregroundColor: UIColor.systemYellow]
    }
    

}
