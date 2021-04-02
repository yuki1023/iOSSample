//
//  DetailViewController.swift
//  original
//
//  Created by 黒部麻由子 on 2020/09/07.
//  Copyright © 2020 mayukokurobe. All rights reserved.
//

import UIKit
import PKHUD
import NCMB

class DetailViewController: UIViewController {
  
    @IBOutlet var containerView: UIView!
    @IBOutlet var containerD: UIView!
    @IBOutlet var containerE: UIView!
    @IBOutlet var containerF: UIView!
    
    var objectID : String!
    var containers: Array<UIView> = []
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
         containers = [containerD,containerE,containerF]
            containerView.bringSubviewToFront(containerD)
        
      }

     // ③
       @IBAction func changeContainerView(_ sender: UISegmentedControl) {
            let currentContainerView = containers[sender.selectedSegmentIndex]
           containerView.bringSubviewToFront(currentContainerView)
           
        print("---------------------------------------------")
        print(objectID)
}
    
    //次の画面を値に渡す時に使う関数
          override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if (segue.identifier == "ContainerD"){
          
              //次の画面を取得
              let DisplayOutlineViewController = segue.destination as! DisplayOutlineViewController
              
              //次の画面に関数を入れている
                DisplayOutlineViewController.outlineID = objectID
                
                
          }else if (segue.identifier == "ContainerE"){
             
                 //次の画面を取得
                 let DisplayfeatureViewControll = segue.destination as! DisplayFeatureViewController
                 
                 //次の画面に関数を入れている
                   DisplayfeatureViewControll.FeatureID = objectID
                   
                   
             }else if (segue.identifier == "ContainerF"){
                
                    //次の画面を取得
                    let DisplaySellectionViewController = segue.destination as! DisplaySellectionViewController
                    
                    //次の画面に関数を入れている
                      DisplaySellectionViewController.SellectionID = objectID
                      
                      
                }

                
                }
       
    @IBAction func delete(){
        let alert: UIAlertController = UIAlertController(title: "Delete", message: "削除してもよろしいですか？", preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let query = NCMBQuery(className: "Outline")
            query?.getObjectInBackground(withId: self.objectID, block: { (save,error) in
                if error != nil {
                print(error)
            } else {
                save?.deleteInBackground({ (error) in
                    if error != nil {
                        HUD.show(.error)
                        print(error)
                    }else{
                        print("成功")
                        PKHUD.sharedHUD.contentView = PKHUDSuccessView(title: "Success", subtitle: "Delete complete")
                        PKHUD.sharedHUD.show(onView: self.view)
                        PKHUD.sharedHUD.hide(afterDelay: 2.0) { _ in
                            self.navigationController?.popViewController(animated: true)
                    }
                    }
                })
            }
        })
        }
        
        //キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .default)
               { ( Action) in
                
                //キャンセルボタンを押した時のアクション
                alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
                        

                
                
        
    }
    
   
}
