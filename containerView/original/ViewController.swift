//
//  ViewController.swift
//  original
//
//  Created by 黒部麻由子 on 2020/09/07.
//  Copyright © 2020 mayukokurobe. All rights reserved.
//

import UIKit
import NCMB

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    var company = [Company]()
    var selectedCell: Company!
    
    @IBOutlet var companyNamecollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        // レイアウト設定
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 118, height: 118)
    
            companyNamecollection.collectionViewLayout = layout
      

        
        
        companyNamecollection.dataSource = self
        
        companyNamecollection.delegate = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: Bundle.main)
        companyNamecollection.register(nib, forCellWithReuseIdentifier: "Cell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadCompany()
        
        
    }
    
    
    
    func loadCompany(){
        let query = NCMBQuery(className: "Outline")
        query?.includeKey("user")
        
        //query?.whereKey("user", equalTo: NCMBuser.current())
        
        //昇順
        query?.order(byDescending: "createDate")
        
        //オブジェクトの取得
        query?.findObjectsInBackground({ (result, error) in
            if error != nil{
                print(error)
            }else{
                //関数の初期化
                self.company = [Company]()
                for companyObject in result as! [NCMBObject]{
                    print(companyObject)
                    
                    let name = companyObject.object(forKey: "name") as! String
                    let industry = companyObject.object(forKey: "industry") as? String
                    let levelTextField = companyObject.object(forKey: "levelTextField") as? String
                    let hp = companyObject.object(forKey: "hp") as? String
                    let mypage = companyObject.object(forKey: "mypage") as? String
                    let ID = companyObject.object(forKey: "ID") as? String
                    let password = companyObject.object(forKey: "password") as? String
                    let establishedYear = companyObject.object(forKey: "establishedYear") as? String
                    let numberOfEmployees = companyObject.object(forKey: "numberOfEmployees") as? String
                    let capital = companyObject.object(forKey: "capital") as? String
                    let location = companyObject.object(forKey: "location") as? String
                    let yenA = companyObject.object(forKey: "yenA") as? String
                    let yenB = companyObject.object(forKey: "yenB") as? String
                    let yenC = companyObject.object(forKey: "yenC") as? String
                    let yearA = companyObject.object(forKey: "yearA") as? String
                    let yearB = companyObject.object(forKey: "yearB") as? String
                    let yearC = companyObject.object(forKey: "yearC") as? String
                    let benefits = companyObject.object(forKey: "benefits") as? String
                    let philosophy = companyObject.object(forKey: "philosophy") as? String
                    let principle = companyObject.object(forKey: "principle") as? String
                    let memo = companyObject.object(forKey: "memo") as? String
                    let contents = companyObject.object(forKey: "contents") as? String
                    let uniqueness = companyObject.object(forKey: "uniqueness") as? String
                    let attractiveness = companyObject.object(forKey: "attractiveness") as? String
                    let wantToDo = companyObject.object(forKey: "wantToDo") as? String
                    let atmosphere = companyObject.object(forKey: "atmosphere") as? String
                    let memoB = companyObject.object(forKey: "memoB") as? String
                    let esItem = companyObject.object(forKey: "esItem") as? String
                    let flow = companyObject.object(forKey: "flow") as? String
                    let statue = companyObject.object(forKey: "statue") as? String
                    let point = companyObject.object(forKey: "point") as? String
                    let esContents = companyObject.object(forKey: "esContents") as? String
                    let memoC = companyObject.object(forKey: "memoC") as? String
                    
                    let companys = Company(objectId: companyObject.objectId, createData: companyObject.createDate, name: name)
                    
                    companys.industry = industry
                    companys.levelTextField = levelTextField
                    companys.hp = hp
                    companys.myPage = mypage
                    companys.ID = ID
                    companys.password = password
                    companys.establishedYear = establishedYear
                    companys.numberOfEmployees = numberOfEmployees
                    companys.capital = capital
                    companys.location = location
                    companys.yenA = yenA
                    companys.yenB = yenB
                    companys.yenC = yenC
                    companys.yearA = yearA
                    companys.yearB = yearB
                    companys.yearC = yearC
                    companys.benefits = benefits
                    companys.philosophy = philosophy
                    companys.principle = principle
                    companys.memo = memo
                    companys.contents = contents
                    companys.uniqueness = uniqueness
                    companys.attractveness = attractiveness
                    companys.wantToDo = wantToDo
                    companys.atmosphere = atmosphere
                    companys.memoB = memoB
                    companys.esItem = esItem
                    companys.flow = flow
                    companys.statue = statue
                    companys.point = point
                    companys.esContents = esContents
                    companys.memoC = memoC
                    
                    self.company.append(companys)
                
                    
                    
                }
                self.companyNamecollection.reloadData()
            }
                
        })
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell = company[indexPath.item]
        performSegue(withIdentifier:"viewDetail", sender: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return company.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .clear// セルの色
        
        
        cell.tag = indexPath.item
        
        let companyName = company[indexPath.item].name
        cell.CorporateNameLabel.text = companyName
        
        return cell
    
    }
    
    //次の画面を値に渡す時に使う関数
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if (segue.identifier == "viewDetail"){
       
           //次の画面を取得
           let detailViewController = segue.destination as! DetailViewController
           
           //次の画面に関数を入れている
            detailViewController.objectID = selectedCell.objectId
       }

       
       }
    

}

