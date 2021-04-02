//
//  topsViewController.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/11.
//

import UIKit
import NCMB
import UIKit
import Kingfisher


class topsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
        @IBOutlet var topsCollectionView: UICollectionView!
        
            var selectedImage: topsImage!

            var topsImages = [topsImage]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topsCollectionView.dataSource = self
        
        topsCollectionView.delegate = self
            
            let nib = UINib(nibName: "topsCollectionViewCell", bundle: Bundle.main)
    
        topsCollectionView.register(nib, forCellWithReuseIdentifier: "topsCell")
        
   // レイアウトを調整
            let layout = UICollectionViewFlowLayout()
            //layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            // Flowlayoutだと大きさがdefaultになっちゃうからitemSizeを追記
            layout.itemSize = CGSize(width: 120, height: 120)
            topsCollectionView.collectionViewLayout = layout
        
            loadtops()

       
    }
    
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return
                topsImages.count
                print(topsImages.count)
                print("1111111111111")
            }

            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topsCell", for: indexPath)as! topsCollectionViewCell
               
                let photoImagePath = topsImages[indexPath.row].imageUrl
                cell.topsImageView.kf.setImage(with:URL (string: photoImagePath))
                cell.topsImageView.image = photoImagePath as? UIImage
                return cell
    
    
    }
    
            func loadtops(){
                let query = NCMBQuery(className:"saveTops")
                
                //降順
                query?.order(byDescending: "creatDate")
        
                query?.findObjectsInBackground({ [self] (result, error) in
            if error != nil {
                
            }else{
                //投稿を格納しておく配列を初期化
                self.topsImages = [topsImage]()
                
                for topsObject in result as! [NCMBObject] {
                
                //情報を取得
                let imageUrl = topsObject.object(forKey: "imageUrl")as! String
                
                //データをtopsImageクラスにセット
                let save = topsImage(objectId:topsObject.objectId, imageUrl: imageUrl, createDate: topsObject.createDate)
                    
                    
                    //配列に加える
                    self.topsImages.append(save)
                    print(self.topsImages)
                }
               
                
                
                }
                    
                //投稿のデータが揃ったらCollectionViewをリロード
                    self.topsCollectionView.reloadData()
                    
                    
                


}
)
                
            }
}
