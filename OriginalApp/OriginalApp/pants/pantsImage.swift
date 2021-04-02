//
//  pantsImage.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/20.
//

import UIKit

class pantsImage: NSObject {
    var objectId: String
    var imageUrl: String
    var createDate: Date
  

    init(objectId: String,  imageUrl: String,  createDate: Date) {
        self.objectId = objectId
        self.imageUrl = imageUrl
        self.createDate = createDate


}
}
