//
//  shoesSaveViewController.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/22.
//

import UIKit
import NCMB
import NYXImagesKit
import EMTNeumorphicView

class shoesSaveViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var shoesImageView: UIImageView!
    
    @IBOutlet var saveShoes: EMTNeumorphicButton!
    
    var imageSave: UIImage?
    
    var resizedImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveShoes.layer.cornerRadius = 20
        saveShoes.neumorphicLayer?.depthType = .convex
        saveShoes.neumorphicLayer?.elementDepth = 10
        saveShoes.neumorphicLayer?.cornerType = .all
        saveShoes.neumorphicLayer?.elementBackgroundColor =
            view.backgroundColor?.cgColor as! CGColor
        
        //　ナビゲーションバーの背景色
    self.navigationController?.navigationBar.barTintColor = .darkGray
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
    self.navigationController?.navigationBar.tintColor = .systemYellow
        // ナビゲーションバーのテキストを変更する
    self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
                .foregroundColor: UIColor.systemYellow]

       
    }
   func selectImage() {
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
       shoesImageView.image = resizedImage
       
       
        picker.dismiss(animated: true, completion: nil)
        
    };override func viewWillAppear(_ animated: Bool) {
        selectImage()
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
                       let postObject = NCMBObject(className: "saveShoes")

                    
                       postObject?.setObject(NCMBUser.current(), forKey: "user")
                       let url = "https://mbaas.api.nifcloud.com/2013-09-01/applications/BRXPDcTyLb1VN1KC/publicFiles/"  + file.name
                       postObject?.setObject(url, forKey: "imageUrl")
                       postObject?.saveInBackground({ (error) in
                           if error != nil {
                               
                           } else {
                               
                               self.shoesImageView.image = nil
                               self.shoesImageView.image = UIImage(named: "photo-placeholder")
                               
                               self.tabBarController?.selectedIndex = 0
                           }
                       })
                   }
               }) { (progress) in
                   print(progress)
               }

   

}
    

   

}
