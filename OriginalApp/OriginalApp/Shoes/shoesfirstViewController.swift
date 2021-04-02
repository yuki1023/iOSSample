//
//  shoesfirstViewController.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/02/08.
//

import UIKit

class shoesfirstViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var shoesbutton: UIButton!
    
    var imageSave: UIImage?
    
    var resizedImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // 枠を丸くする.
            shoesbutton.layer.masksToBounds = true
        // コーナーの半径を設定する.
           shoesbutton.layer.cornerRadius = 25.0
         
        
        //　ナビゲーションバーの背景色
            self.navigationController?.navigationBar.barTintColor = .darkGray
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
            self.navigationController?.navigationBar.tintColor = .systemYellow
        // ナビゲーションバーのテキストを変更する
            self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
                .foregroundColor: UIColor.systemYellow]
        
        
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
        //topsSaveViewController.topsImageView.image = resizedImage
         
         print(resizedImage)
          picker.dismiss(animated: true, completion: nil)
          
          
          
      }
    //segue準備
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toShoes") {
            let shoesSaveViewController = segue.destination as!shoesSaveViewController
            shoesSaveViewController.imageSave = resizedImage
            
            print(resizedImage)*/
        }
    
    

   

   

        

    
       
    
    

    


