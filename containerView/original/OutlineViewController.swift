//
//  OutlineViewController.swift
//  original
//
//  Created by 黒部麻由子 on 2020/09/18.
//  Copyright © 2020 mayukokurobe. All rights reserved.
//

import UIKit
import NCMB
import PKHUD

class OutlineViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    
    
    
    
    @IBOutlet var name:UITextField!
    @IBOutlet var industry:UITextField!
    @IBOutlet var levelTextField:UITextField!
    @IBOutlet var hp:UITextField!
    @IBOutlet var myPage:UITextField!
    @IBOutlet var ID:UITextField!
    @IBOutlet var password:UITextField!
    @IBOutlet var establishedYear:UITextField!
    @IBOutlet var numberOfEmployees:UITextField!
    @IBOutlet var capital:UITextField!
    @IBOutlet var location:UITextField!
    @IBOutlet var yenA:UITextField!
    @IBOutlet var yenB:UITextField!
    @IBOutlet var yenC:UITextField!
    @IBOutlet var yearA:UITextField!
    @IBOutlet var yearB:UITextField!
    @IBOutlet var yearC:UITextField!
    @IBOutlet var benefits:UITextView!
    @IBOutlet var philosophy:UITextView!
    @IBOutlet var principle:UITextView!
    @IBOutlet var memoA:UITextView!
    
    var selectedLevel: String!
    let levelArray = ["A","B","C"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelTextField.delegate = self
        createPickerView()
        dissmissPickerView()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        let appDomain = Bundle.main.bundleIdentifier
        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
    }
    
    
    
    @IBAction func Outline(){
        
        let alert: UIAlertController = UIAlertController(title: "Save", message: "保存してもよろしいですか？", preferredStyle: .alert)
        // OKボタン
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
            

            let ud = UserDefaults.standard
            
        let saveObject = NCMBObject(className: "Outline")
            saveObject?.setObject(self.name.text!, forKey: "name")
            saveObject?.setObject(self.levelTextField.text, forKey: "level")
            saveObject!.setObject(self.industry.text, forKey: "industry")
            saveObject!.setObject(self.hp.text, forKey: "hp")
            saveObject!.setObject(self.myPage.text, forKey: "myPage")
            saveObject!.setObject(self.ID.text, forKey: "ID")
            saveObject!.setObject(self.password.text, forKey: "password")
            saveObject!.setObject(self.establishedYear.text, forKey: "establishedYear")
            saveObject!.setObject(self.numberOfEmployees.text, forKey: "numberOfEmployees")
            saveObject!.setObject(self.capital.text, forKey: "capital")
            saveObject!.setObject(self.location.text, forKey: "location")
            saveObject!.setObject(self.yenA.text, forKey: "yenA")
            saveObject!.setObject(self.yenB.text, forKey: "yenB")
            saveObject!.setObject(self.yenC.text, forKey: "yenC")
            saveObject!.setObject(self.yearA.text, forKey: "yearA")
            saveObject!.setObject(self.yearB.text, forKey: "yearB")
            saveObject!.setObject(self.yearC.text, forKey: "yearC")
            saveObject!.setObject(self.benefits.text, forKey: "benefits")
            saveObject!.setObject(self.philosophy.text, forKey: "philosophy")
            saveObject!.setObject(self.principle.text, forKey: "principle")
            saveObject!.setObject(self.memoA.text, forKey: "memo")
            
            saveObject?.setObject(ud.object(forKey: "userName"), forKey: "userName")
            
//            FeatureViewControllerからデータとってくる
            saveObject?.setObject(ud.string(forKey: "contents"), forKey: "contents")
            saveObject?.setObject(ud.string(forKey: "uniqueness"), forKey: "uniqueness")
            saveObject?.setObject(ud.string(forKey: "attractiveness"), forKey: "attractiveness")
            saveObject?.setObject(ud.string(forKey: "wantToDo"), forKey: "wantToDo")
            saveObject?.setObject(ud.string(forKey: "atmosphere"), forKey: "atmosphere")
            saveObject?.setObject(ud.string(forKey: "memoB"), forKey: "memoB")
            
            //SellectionViewControllerからデータとってくる
            saveObject?.setObject(ud.string(forKey: "esItem"), forKey: "esItem")
            saveObject?.setObject(ud.string(forKey: "flow"), forKey: "flow")
            saveObject?.setObject(ud.string(forKey: "statue"), forKey: "statue")
            saveObject?.setObject(ud.string(forKey: "point"), forKey: "point")
            saveObject?.setObject(ud.string(forKey: "esContents"), forKey: "esContents")
            saveObject?.setObject(ud.string(forKey: "memoC"), forKey: "memoC")
            saveObject?.setObject(ud.string(forKey: "dateField"), forKey: "dateField")
        
        saveObject?.saveInBackground({ (error) in
        if error != nil {
        HUD.show(.error)
        print("error")
        } else {
        print("success")
        PKHUD.sharedHUD.contentView = PKHUDSuccessView(title: "Success", subtitle: "Save complete")
        PKHUD.sharedHUD.show(onView: self.view)
        PKHUD.sharedHUD.hide(afterDelay: 2.0) { _ in
            self.navigationController?.popViewController(animated: true)

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
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        levelTextField.inputView = pickerView
        
    }
    
    func  dissmissPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
        toolBar.setItems([done], animated: false)
        toolBar.isUserInteractionEnabled = true
        levelTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed(){
        if selectedLevel != nil{
            levelTextField.text = selectedLevel
        
        }else{
            levelTextField.text = "C"
        }
        self.levelTextField.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return levelArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return levelArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedLevel = levelArray[row]
       
    }
   

   }
