//
//  pantsViewController.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/11.
//

import UIKit
import NCMB
import UIKit
import Kingfisher

class pantsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    
        @IBOutlet var pantsCollectionView: UICollectionView!
        
            var selectedImage: pantsImage!

            var pantsImages = [pantsImage]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       pantsCollectionView.dataSource = self
        
        pantsCollectionView.delegate = self
            
            let nib = UINib(nibName: "pantsCollectionViewCell", bundle: Bundle.main)
    
       pantsCollectionView.register(nib, forCellWithReuseIdentifier: "pantsCell")
        
   // レイアウトを調整
            let layout = UICollectionViewFlowLayout()
            //layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            // Flowlayoutだと大きさがdefaultになっちゃうからitemSizeを追記
            layout.itemSize = CGSize(width: 120, height: 120)
            pantsCollectionView.collectionViewLayout = layout
        
            loadpants()

       
    }
    
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return
                pantsImages.count
                print(pantsImages.count)
                print("1111111111111")
            }

            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pantsCell", for: indexPath)as! pantsCollectionViewCell
               
                let photoImagePath = pantsImages[indexPath.row].imageUrl
                cell.pantsImageView.kf.setImage(with:URL (string: photoImagePath))
                cell.pantsImageView.image = photoImagePath as? UIImage
                return cell
    
    
    }
    
            func loadpants(){
                let query = NCMBQuery(className:"savePants")
                
                //降順
                query?.order(byDescending: "creatDate")
        
                query?.findObjectsInBackground({ [self] (result, error) in
            if error != nil {
                
            }else{
                //投稿を格納しておく配列を初期化
                self.pantsImages = [pantsImage]()
                
                for pantsObject in result as! [NCMBObject] {
                
                //情報を取得
                let imageUrl = pantsObject.object(forKey: "imageUrl")as! String
                
                //データをpantsImageクラスにセット
                let save = pantsImage(objectId:pantsObject.objectId, imageUrl: imageUrl, createDate:pantsObject.createDate)
                    
                    
                    //配列に加える
                    self.pantsImages.append(save)
                    print(self.pantsImages)
                }
               
                
                
                }
                    
                //投稿のデータが揃ったらCollectionViewをリロード
                    self.pantsCollectionView.reloadData()
                    
    

    

}
               ) }
}
