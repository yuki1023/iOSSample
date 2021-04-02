//
//  outerSaveViewController.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/21.
//

import UIKit
import NCMB
import NYXImagesKit
import EMTNeumorphicView

class outerSaveViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet var outerImageView: UIImageView!
    
    @IBOutlet var selectImages: EMTNeumorphicButton!
    
    @IBOutlet var saveImages: EMTNeumorphicButton!
    
    var resizedImage: UIImage!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        selectImages.layer.cornerRadius = 20
        selectImages.neumorphicLayer?.depthType = .convex
        selectImages.neumorphicLayer?.elementDepth = 10
        selectImages.neumorphicLayer?.cornerType = .all
        selectImages.neumorphicLayer?.elementBackgroundColor =
            view.backgroundColor?.cgColor as! CGColor
        
        saveImages.layer.cornerRadius = 20
        saveImages.neumorphicLayer?.depthType = .convex
        saveImages.neumorphicLayer?.elementDepth = 10
        saveImages.neumorphicLayer?.cornerType = .all
        saveImages.neumorphicLayer?.elementBackgroundColor =
            view.backgroundColor?.cgColor as! CGColor
        
    
        // Do any additional setup after loading the view.
    }
  @IBAction func selectImage() {
        let alertController = UIAlertController(title: "画像選択", message: "画像を選択して下さい。", preferredStyle:.actionSheet)
          
        let cameraAction = UIAlertAction(title:"カメラで撮影", style:.default) { (action) in
            // カメラ起動
            //カメラが使えたら
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.allowsEditing = true
                picker.delegate = self
                self.present(picker, animated:true, completion:nil)
            } else {
                print("この機種ではカメラが使用出来ません。")
                
                
            
            
            }
            
        }
            //アルバム起動
        let photoLibraryAction = UIAlertAction(title: "フォトライブラリから選択", style:.default) { (action) in
           
            
            // アルバム起動
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true {
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.allowsEditing = true
                picker.delegate = self
                self.present(picker, animated:true, completion:nil)
            } else {
                print("この機種ではフォトライブラリが使用出来ません。")
                            
            }
            
        }
                let cancelAction = UIAlertAction(title:"キャンセル", style:.cancel) { (action) in
                alertController.dismiss(animated:true, completion:nil)
            }
                alertController.addAction(cameraAction)
                alertController.addAction(photoLibraryAction)
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true, completion: nil)
        
          }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //NYXImagesKitライブラリでリサイズを行う。
        resizedImage = selectedImage.scale(byFactor: 0.2)
        outerImageView.image = resizedImage
       
       
        picker.dismiss(animated: true, completion: nil)
        
        
        
    }
    @IBAction func saveImage(){
        // 撮影した画像をデータ化したときに右に90度回転してしまう問題の解消
               UIGraphicsBeginImageContext(resizedImage.size)
               let rect = CGRect(x: 0, y: 0, width: resizedImage.size.width, height: resizedImage.size.height)
               resizedImage.draw(in: rect)
               resizedImage = UIGraphicsGetImageFromCurrentImageContext()
               UIGraphicsEndImageContext()

        let data = resizedImage.pngData()
               let file = NCMBFile.file(with: data) as! NCMBFile
               file.saveInBackground({ (error) in
                   if error != nil {
                     
                    let alert = UIAlertController(title: "画像アップロードエラー", message: error!.localizedDescription, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in

                    })
                       alert.addAction(okAction)
                       self.present(alert, animated: true, completion: nil)
                   } else {
                       // 画像アップロードが成功
                       let postObject = NCMBObject(className: "saveOuter")

                    
                       postObject?.setObject(NCMBUser.current(), forKey: "user")
                       let url = "https://mbaas.api.nifcloud.com/2013-09-01/applications/BRXPDcTyLb1VN1KC/publicFiles/"  + file.name
                       postObject?.setObject(url, forKey: "imageUrl")
                       postObject?.saveInBackground({ (error) in
                           if error != nil {
                               
                           } else {
                               
                               self.outerImageView.image = nil
                               self.outerImageView.image = UIImage(named: "photo-placeholder")
                               
                               self.tabBarController?.selectedIndex = 0
                           }
                       })
                   }
               }) { (progress) in
                   print(progress)
               }

   

}
}
