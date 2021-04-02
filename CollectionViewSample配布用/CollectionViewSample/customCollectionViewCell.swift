//
//  customCollectionViewCell.swift
//  CollectionViewSample
//
//  Created by 長谷川巧 on 2020/08/26.
//  Copyright © 2020 HasegawaTakumi. All rights reserved.
//

import UIKit

//カスタムセルはコード書いておきました。
class customCollectionViewCell: UICollectionViewCell {
    
    //カスタムセル上のUI
    @IBOutlet var animalImage : UIImageView!
    @IBOutlet var animalNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //cellの枠の幅
        self.layer.borderWidth = 1.0
        // cellの枠の色
        self.layer.borderColor = UIColor.black.cgColor
        // cellを丸くする
        self.layer.cornerRadius = 8.0
        
    }

    
    
}
