//
//  customViewController.swift
//  CollectionViewSample
//
//  Created by 長谷川巧 on 2020/08/26.
//  Copyright © 2020 HasegawaTakumi. All rights reserved.
//

import UIKit

class customViewController: UIViewController {
    
    //collectionViewの宣言はしてあるよ！
    @IBOutlet var customCollectionView : UICollectionView!
  
    //名前と写真の配列の宣言はしてあるよー
    let animalName = ["dog", "monkey", "penguin", "coala"]
    let animalImages = [UIImage(named: "dog.jpg"), UIImage(named: "monkey.jpeg") , UIImage(named: "penguin.jpeg"), UIImage(named: "coala.jpeg")]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //nib(カスタムセル)の登録が必要だよ

        // レイアウト設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        customCollectionView.collectionViewLayout = layout
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //配列の個数分セルを生成するにはどうすればいい？
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //カスタムセルを扱う時はここのコードはどうする？
        
    }
}
