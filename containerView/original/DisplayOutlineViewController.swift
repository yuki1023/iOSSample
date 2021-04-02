//
//  DisplayOutlineViewController.swift
//  original
//
//  Created by 黒部麻由子 on 2020/09/28.
//  Copyright © 2020 mayukokurobe. All rights reserved.
//

import UIKit
import NCMB

class DisplayOutlineViewController: UIViewController {

    var outlineID : String!
    
    @IBOutlet var name : UITextField!
    @IBOutlet var industry : UITextField!
    @IBOutlet var levelTextField : UITextField!
    @IBOutlet var hp : UITextField!
    @IBOutlet var mypage : UITextField!
    @IBOutlet var ID : UITextField!
    @IBOutlet var password : UITextField!
    @IBOutlet var establishedyear : UITextField!
    @IBOutlet var numberOfEmployees : UITextField!
    @IBOutlet var capital : UITextField!
    @IBOutlet var location : UITextField!
    @IBOutlet var yenA : UITextField!
    @IBOutlet var yenB : UITextField!
    @IBOutlet var yenC : UITextField!
    @IBOutlet var yearA : UITextField!
    @IBOutlet var yearB : UITextField!
    @IBOutlet var yearC : UITextField!
    @IBOutlet var benifits : UITextView!
    @IBOutlet var philosophy : UITextView!
    @IBOutlet var principle : UITextView!
    @IBOutlet var memo : UITextView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       print("__________outline____________")
       print(outlineID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadCompany()
    }
    
       func loadCompany(){
           let query = NCMBQuery(className: "Outline")
  
           query?.whereKey("objectId", equalTo: outlineID)
           
           
           //オブジェクトの取得
           query?.findObjectsInBackground({ (result, error) in
               if error != nil{
                   print(error)
               }else{
                for companyObject in result as! [NCMBObject]{
                                  print(companyObject)
                                  
                                  let outlineName = companyObject.object(forKey: "name") as! String
                                  let outlineIndustry = companyObject.object(forKey: "industry") as? String
                                  let outlineLevelTextField = companyObject.object(forKey: "level") as? String
                                  let outlineHp = companyObject.object(forKey: "hp") as? String
                                  let outlineMypage = companyObject.object(forKey: "mypage") as? String
                                  let outlineID = companyObject.object(forKey: "ID") as? String
                                  let outlinePassword = companyObject.object(forKey: "password") as? String
                                  let outlineEstablishedYear = companyObject.object(forKey: "establishedYear") as? String
                                  let outlineNumberOfEmployees = companyObject.object(forKey: "numberOfEmployees") as? String
                                  let outlineCapital = companyObject.object(forKey: "capital") as? String
                                  let outlineLocation = companyObject.object(forKey: "location") as? String
                                  let outlineYenA = companyObject.object(forKey: "yenA") as? String
                                  let outlineYenB = companyObject.object(forKey: "yenB") as? String
                                  let outlineYenC = companyObject.object(forKey: "yenC") as? String
                                  let outlineYearA = companyObject.object(forKey: "yearA") as? String
                                  let outlineYearB = companyObject.object(forKey: "yearB") as? String
                                  let outlineYearC = companyObject.object(forKey: "yearC") as? String
                                  let outlineBenefits = companyObject.object(forKey: "benefits") as? String
                                  let outlinePhilosophy = companyObject.object(forKey: "philosophy") as? String
                                  let outlinePrinciple = companyObject.object(forKey: "principle") as? String
                                  let outlineMemo = companyObject.object(forKey: "memo") as? String
                                  let outlineContents = companyObject.object(forKey: "contents") as? String
                                  let outlineUiqueness = companyObject.object(forKey: "uniqueness") as? String
                                  let outlineAttractiveness = companyObject.object(forKey: "attractiveness") as? String
                                  let outlineWantToDo = companyObject.object(forKey: "wantToDo") as? String
                                  let outlineOtmosphere = companyObject.object(forKey: "atmosphere") as? String
                                  let outlineMemoB = companyObject.object(forKey: "memoB") as? String
                                  let outlineEsItem = companyObject.object(forKey: "esItem") as? String
                                  let outlineOutlineFlow = companyObject.object(forKey: "flow") as? String
                                  let outlineStatue = companyObject.object(forKey: "statue") as? String
                                  let outlinePoint = companyObject.object(forKey: "point") as? String
                                  let outlineEsContents = companyObject.object(forKey: "esContents") as? String
                                  let outlineMemoC = companyObject.object(forKey: "memoC") as? String
         
                    self.name.text = outlineName
                    self.industry.text = outlineIndustry
                    self.levelTextField.text = outlineLevelTextField
                    self.hp.text = outlineHp
                    self.mypage.text = outlineMypage
                    self.ID.text = outlineID
                    self.password.text = outlinePassword
                    self.establishedyear.text = outlineEstablishedYear
                    self.numberOfEmployees.text = outlineNumberOfEmployees
                    self.capital.text = outlineCapital
                    self.location.text = outlineLocation
                    self.yenA.text = outlineYenA
                    self.yenB.text = outlineYenB
                    self.yenC.text = outlineYenC
                    self.yearA.text = outlineYearA
                    self.yearB.text = outlineYearB
                    self.yearC.text = outlineYearC
                    self.benifits.text = outlineBenefits
                    self.philosophy.text = outlinePhilosophy
                    self.hp.text = outlineHp
                    self.principle.text = outlinePrinciple
                    self.memo.text = outlineMemo
                    
                    
                
                    
                    
                    
                    
                

}

}

})
}
}
