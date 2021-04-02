//
//  FeatureViewController.swift
//  original
//
//  Created by 黒部麻由子 on 2020/09/18.
//  Copyright © 2020 mayukokurobe. All rights reserved.
//

import UIKit
import NCMB
import PKHUD

class FeatureViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate{
    
    @IBOutlet var contents:UITextView!
    @IBOutlet var uniqueness:UITextView!
    @IBOutlet var attractveness:UITextView!
    @IBOutlet var wantToDo:UITextView!
    @IBOutlet var atmosphere:UITextView!
    @IBOutlet var memoB:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contents.delegate = self
        contents.tag = 1
        
        uniqueness.delegate = self
        uniqueness.tag = 2
        
        attractveness.delegate = self
        attractveness.tag = 3
        
        wantToDo.delegate = self
        wantToDo.tag = 4
        
        atmosphere.delegate = self
        atmosphere.tag = 5
        
        memoB.delegate = self
        memoB.tag = 6
        

    }
    
    @IBAction func Outline(){
    
    let alert: UIAlertController = UIAlertController(title: "Save", message: "保存してもよろしいですか？", preferredStyle: .alert)
    // OKボタン
    let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { (action) in
    let saveObject = NCMBObject(className: "Outline")
        saveObject!.setObject(self.contents.text, forKey: "contents")
        saveObject!.setObject(self.uniqueness.text, forKey: "uniqueness")
        saveObject!.setObject(self.attractveness.text, forKey: "attractveness")
        saveObject!.setObject(self.wantToDo.text, forKey: "wantToDo")
        saveObject!.setObject(self.atmosphere.text, forKey: "atmosphere")
        saveObject!.setObject(self.memoB.text, forKey: "memoB")
    
    saveObject?.saveInBackground({ (error) in
    if error != nil {
    HUD.show(.error)
    print(error)
    } else {
    print("success")
    PKHUD.sharedHUD.contentView = PKHUDSuccessView(title: "Success", subtitle: "Save complete")
    PKHUD.sharedHUD.show(onView: self.view)
    PKHUD.sharedHUD.hide(afterDelay: 2.0) { _ in


}
        }
        })

        }
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
        //キャンセルボタンを押した時のアクション
        alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let ud = UserDefaults.standard
        if textView.tag == 1 {
            ud.set(textView.text, forKey: "contents")
        }else if textView.tag == 2{
            ud.set(textView.text, forKey: "uniqueness")
        }else if textView.tag == 3{
            ud.set(textView.text, forKey: "attractiveness")
        }else if textView.tag == 4{
            ud.set(textView.text, forKey: "wantToDo")
        }else if textView.tag == 5{
            ud.set(textView.text, forKey: "atmosphere")
        }else if textView.tag == 6{
        ud.set(textView.text, forKey: "memoB")
        }


}
    
    
}
