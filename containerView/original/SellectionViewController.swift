//
//  SellectionViewController.swift
//  original
//
//  Created by 黒部麻由子 on 2020/09/18.
//  Copyright © 2020 mayukokurobe. All rights reserved.
//

import UIKit
import NCMB
import PKHUD

class SellectionViewController: UIViewController,UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var esItem:UITextView!
    @IBOutlet var flow:UITextView!
    @IBOutlet var statue:UITextView!
    @IBOutlet var point:UITextView!
    @IBOutlet var esContents:UITextView!
    @IBOutlet var memoC:UITextView!
    
    
    @IBOutlet weak var dateField: UITextField!
    
    //UIDatePickerを定義するための変数
       let datePicker = UIDatePicker()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        esItem.delegate = self
        esItem.tag = 1
        
        flow.delegate = self
        flow.tag = 2
        
        statue.delegate = self
        statue.tag = 3
        
        point.delegate = self
        point.tag = 4
        
        esContents.delegate = self
        esContents.tag = 5
        
        memoC.delegate = self
        memoC.tag = 6
        
        dateField.delegate = self
        dateField.tag = 7
        
        createDatePicker()
    }
        
        func createDatePicker(){

            // DatePickerModeをDate(日付)に設定
            datePicker.datePickerMode = .date

            // DatePickerを日本語化
            datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale

            // textFieldのinputViewにdatepickerを設定
            dateField.inputView = datePicker

            // UIToolbarを設定
            let toolbar = UIToolbar()
            toolbar.sizeToFit()

            // Doneボタンを設定(押下時doneClickedが起動)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))

            // Doneボタンを追加
            toolbar.setItems([doneButton], animated: true)

            // FieldにToolbarを追加
            dateField.inputAccessoryView = toolbar
        }

       @objc func doneClicked(){
            let dateFormatter = DateFormatter()

            // 持ってくるデータのフォーマットを設定
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateFormatter.locale    = NSLocale(localeIdentifier: "ja_JP") as Locale?
            dateFormatter.dateStyle = DateFormatter.Style.medium

            // textFieldに選択した日付を代入
            dateField.text = dateFormatter.string(from: datePicker.date)
        
        let ud = UserDefaults.standard
                   if dateField.tag == 7 {
                       ud.set(dateField.text, forKey: "dateField")
        }

            // キーボードを閉じる
            self.view.endEditing(true)
        }

            


        
    
    
    
    @IBAction func Outline(){
        
        let alert: UIAlertController = UIAlertController(title: "Save", message: "保存してもよろしいですか？", preferredStyle: .alert)
        // OKボタン
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { (action) in
        let saveObject = NCMBObject(className: "Outline")
            saveObject!.setObject(self.esItem.text, forKey: "esItem")
            saveObject!.setObject(self.flow.text, forKey: "flow")
            saveObject!.setObject(self.statue.text, forKey: "statue")
            saveObject!.setObject(self.point.text, forKey: "point")
            saveObject!.setObject(self.esContents.text, forKey: "esContents")
            saveObject!.setObject(self.memoC.text, forKey: "memoC")
            
        
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
               ud.set(textView.text, forKey: "esItem")
           }else if textView.tag == 2{
               ud.set(textView.text, forKey: "flow")
           }else if textView.tag == 3{
               ud.set(textView.text, forKey: "statue")
           }else if textView.tag == 4{
               ud.set(textView.text, forKey: "point")
           }else if textView.tag == 5{
               ud.set(textView.text, forKey: "esContents")
           }else if textView.tag == 6{
           ud.set(textView.text, forKey: "memoC")
        

}
        
        //func textFieldDidShouldEndEditing(_ textField: UITextField){
            //let ud = UserDefaults.standard
           // if textField.tag == 7 {
                //ud.set(textField.text, forKey: "dateField")
       // }
    
//}
}
}
