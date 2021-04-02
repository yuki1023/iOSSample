//
//  homeViewController.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/02.
//

import UIKit
import NCMB
import NYXImagesKit

class homeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //@IBOutlet var outerImageView: UIImageView!
    
    @IBOutlet var topsImageView: UIImageView!
    
    @IBOutlet var pantsImageView: UIImageView!
    
    @IBOutlet var shoesImageView: UIImageView!
    
    var resizedImage: UIImage!
    
    var tops = [String]()
    
    
    
    
    var picker1 = UIImagePickerController()
    var picker2 = UIImagePickerController()
    var picker3 = UIImagePickerController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UITabBar.appearance().barTintColor = UIColor.darkGray
        
        // タブバーアイコン選択時の色を変更（iOS 9以前でも利用可能）
        UITabBar.appearance().tintColor = UIColor.white
        
        // タブバーアイコン非選択時の色を変更（iOS 10で利用可能）
        UITabBar.appearance().unselectedItemTintColor = UIColor.systemYellow
        
        
        
        
        
    }
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //NYXImagesKitライブラリでリサイズを行う。
        resizedImage = selectedImage.scale(byFactor: 0.2)
        //outerImageView.image = resizedImage
        
        if picker == picker1{
        topsImageView.image = resizedImage
            picker1.dismiss(animated: true, completion: nil)
        }else if picker == picker2{
            pantsImageView.image = resizedImage
            picker2.dismiss(animated: true, completion: nil)
        } else if picker == picker3{
            shoesImageView.image = resizedImage
            picker3.dismiss(animated: true, completion: nil)
        }


        
        
        
    }

    
    
    
    @IBAction func selectTops() {
        let alertController = UIAlertController(title: "画像選択", message: "画像を選択して下さい。", preferredStyle:.actionSheet)
        
        let cameraAction = UIAlertAction(title:"カメラで撮影", style:.default) { (action) in
            // カメラ起動
            //カメラが使えたら
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
//                let picker1 = UIImagePickerController()
                self.picker1.sourceType = .camera
                self.picker1.allowsEditing = true
                self.picker1.delegate = self
                self.present(self.picker1, animated:true, completion:nil)
            } else {
                print("この機種ではカメラが使用出来ません。")
                
                
            }
        }
        
        //アルバム起動
        let photoLibraryAction = UIAlertAction(title: "フォトライブラリから選択", style:.default) { (action) in
            
            
            // アルバム起動
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true {
//                let picker = UIImagePickerController()
                self.picker1.sourceType = .photoLibrary
                self.picker1.allowsEditing = true
                self.picker1.delegate = self
                self.present(self.picker1, animated:true, completion:nil)
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
    
    @IBAction func selectPants() {
        let alertController = UIAlertController(title: "画像選択", message: "画像を選択して下さい。", preferredStyle:.actionSheet)
        
        let cameraAction = UIAlertAction(title:"カメラで撮影", style:.default) { (action) in
            // カメラ起動
            //カメラが使えたら
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
                let picker = UIImagePickerController()
                self.picker2.sourceType = .camera
                self.picker2.allowsEditing = true
                self.picker2.delegate = self
                self.present(self.picker2, animated:true, completion:nil)
            } else {
                print("この機種ではカメラが使用出来ません。")
                
                
            }
        }
        //アルバム起動
        let photoLibraryAction = UIAlertAction(title: "フォトライブラリから選択", style:.default) { (action) in
            
            
            // アルバム起動
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true {
//                let picker = UIImagePickerController()
                self.picker2.sourceType = .photoLibrary
                self.picker2.allowsEditing = true
                self.picker2.delegate = self
                self.present(self.picker2, animated:true, completion:nil)
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
    @IBAction func selectShoes() {
        let alertController = UIAlertController(title: "画像選択", message: "画像を選択して下さい。", preferredStyle:.actionSheet)
        
        let cameraAction = UIAlertAction(title:"カメラで撮影", style:.default) { (action) in
            // カメラ起動
            //カメラが使えたら
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
//                let picker = UIImagePickerController()
                self.picker3.sourceType = .camera
                self.picker3.allowsEditing = true
                self.picker3.delegate = self
                self.present(self.picker3, animated:true, completion:nil)
            } else {
                print("この機種ではカメラが使用出来ません。")
                
                
            }
        }
        //アルバム起動
        let photoLibraryAction = UIAlertAction(title: "フォトライブラリから選択", style:.default) { (action) in
            
            
            // アルバム起動
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true {
//                let picker = UIImagePickerController()
                self.picker3.sourceType = .photoLibrary
                self.picker3.allowsEditing = true
                self.picker3.delegate = self
                self.present(self.picker3, animated:true, completion:nil)
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
                        
                        self.topsImageView.image = nil
                        self.topsImageView.image = UIImage(named: "photo-placeholder")
                        
                        self.tabBarController?.selectedIndex = 0
                    }
                })
            }
        }) { (progress) in
            print(progress)
        }
        
////        topsを読み込む
//        func loadData1(){
//
//            let
////            Readのコード
//
//            
//
//
//        }
//
////        pantsを読み込む
//        func loadData2(){
//
//
//        }
//
////        shoesを読み込む
//
        
        
        
        /*@IBAction func selectShoes() {
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
         self.present(alertController, animated: true, completion: nil)*/
        
    }
    
    
    
    
    
    
    
    
    /*@IBAction func topsImage(){
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
     let postObject = NCMBObject(className: "saveTops")
     
     
     postObject?.setObject(NCMBUser.current(), forKey: "user")
     let url = "https://mbaas.api.nifcloud.com/2013-09-01/applications/BRXPDcTyLb1VN1KC/publicFiles/"  + file.name
     postObject?.setObject(url, forKey: "imageUrl")
     postObject?.saveInBackground({ (error) in
     if error != nil {
     
     } else {
     
     self.topsImageView.image = nil
     self.topsImageView.image = UIImage(named: "photo-placeholder")
     
     self.tabBarController?.selectedIndex = 0
     }
     })
     }
     }) { (progress) in
     print(progress)/*
     }
     }
     
     
     
     
     
     
     
     
     
     
     
     */*/
}
