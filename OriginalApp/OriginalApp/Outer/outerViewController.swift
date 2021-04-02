//
//  outerViewController.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/11.
//

import UIKit
import NCMB
import UIKit
import Kingfisher




class outerViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
        
        @IBOutlet var outerCollectionView: UICollectionView!
    
        var selectedImage: saveImage!
    
        var saveImages = [saveImage]()
    
   
        
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            outerCollectionView.dataSource = self
            
            outerCollectionView.delegate = self
                
                let nib = UINib(nibName: "outerCollectionViewCell", bundle: Bundle.main)
        
            outerCollectionView.register(nib, forCellWithReuseIdentifier: "outerCell")
            
       // レイアウトを調整
                let layout = UICollectionViewFlowLayout()
                //layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                // Flowlayoutだと大きさがdefaultになっちゃうからitemSizeを追記
                layout.itemSize = CGSize(width: 120, height: 120)
                outerCollectionView.collectionViewLayout = layout
            
                loadouter()
            
            
            
        
        
        
        
        
       
    }
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return saveImages.count
                print(saveImages.count)
                print("1111111111111")
            }

            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "outerCell", for: indexPath)as! outerCollectionViewCell
               
                let photoImagePath = saveImages[indexPath.row].imageUrl
                cell.outerImageView.kf.setImage(with:URL (string: photoImagePath))
                cell.outerImageView.image = photoImagePath as? UIImage
                return cell
    
    
    }
    
            func loadouter(){
                let query = NCMBQuery(className:"saveOuter")
                
                //降順
                query?.order(byDescending: "creatDate")
        
                query?.findObjectsInBackground({ [self] (result, error) in
            if error != nil {
                
            }else{
                //投稿を格納しておく配列を初期化
                self.saveImages = [saveImage]()
                
                for outerObject in result as! [NCMBObject] {
                
                //情報を取得
                let imageUrl = outerObject.object(forKey: "imageUrl")as! String
                
                //データをsaveImageクラスにセット
                let save = saveImage(objectId:outerObject.objectId, imageUrl: imageUrl, createDate: outerObject.createDate)
                    
                    
                    //配列に加える
                    self.saveImages.append(save)
                    print(self.saveImages)
                }
               
                
                
                }
                    
                //投稿のデータが揃ったらCollectionViewをリロード
                    self.outerCollectionView.reloadData()
                    
                    
                
                  
                }
                
)}
}
