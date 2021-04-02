//
//  shoesViewController.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/11.
//

import UIKit
import NCMB
import UIKit
import Kingfisher


class shoesViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet var shoesCollectionView: UICollectionView!
    
        var selectedImage: shoesImage!

        var shoesImages = [shoesImage]()



        override func viewDidLoad() {
                super.viewDidLoad()
    
                shoesCollectionView.dataSource = self
    
                shoesCollectionView.delegate = self
        
                let nib = UINib(nibName: "shoesCollectionViewCell", bundle: Bundle.main)

            shoesCollectionView.register(nib, forCellWithReuseIdentifier: "shoesCell")
    
                // レイアウトを調整
            let layout = UICollectionViewFlowLayout()
            //layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            // Flowlayoutだと大きさがdefaultになっちゃうからitemSizeを追記
            layout.itemSize = CGSize(width: 120, height: 120)
           shoesCollectionView.collectionViewLayout = layout
        
            loadshoes()

   
}

            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return
                shoesImages.count
                print(shoesImages.count)
                print("1111111111111")
            }

            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoesCell", for: indexPath)as! shoesCollectionViewCell
               
                let photoImagePath = shoesImages[indexPath.row].imageUrl
                cell.shoesImageView.kf.setImage(with:URL (string: photoImagePath))
                cell.shoesImageView.image = photoImagePath as? UIImage
                return cell


}

            func loadshoes(){
                let query = NCMBQuery(className:"saveShoes")
                
                //降順
                query?.order(byDescending: "creatDate")
        
                query?.findObjectsInBackground({ [self] (result, error) in
            if error != nil {
                
            }else{
                //投稿を格納しておく配列を初期化
                self.shoesImages = [shoesImage]()
                
                for shoesObject in result as! [NCMBObject] {
                
                //情報を取得
                let imageUrl = shoesObject.object(forKey: "imageUrl")as! String
                
                //データをtopsImageクラスにセット
                let save = shoesImage(objectId:shoesObject.objectId, imageUrl: imageUrl, createDate: shoesObject.createDate)
                    
                    
                    //配列に加える
                    self.shoesImages.append(save)
                    print(self.shoesImages)
                }
               
                
                
                }
                    
                //投稿のデータが揃ったらCollectionViewをリロード
                    self.shoesCollectionView.reloadData()
                    
                
            


}
)
            
        }
        // Do any additional setup after loading the view.
    }
    



