//
//  shoesImage.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/21.
//

import UIKit

class shoesImage: NSObject {
    var objectId: String
    var imageUrl: String
    var createDate: Date
  
    init(objectId: String,  imageUrl: String,  createDate: Date) {
        self.objectId = objectId
        self.imageUrl = imageUrl
        self.createDate = createDate

}
}
