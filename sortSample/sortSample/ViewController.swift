//
//  ViewController.swift
//  sortSample
//
//  Created by 樋口裕貴 on 2021/02/25.
//  Copyright © 2021 Yuki Higuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var testDict:[Int:String] = [1:"a",2:"b",3:"c",4:"d",5:"e",5:"f",4:"g",3:"h",2:"i",1:"j"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       
        
        
    }
    
    
    
    
    func sort(){
        
        //        ソート機能
        var keys : Array = Array(testDict.keys)
        
        keys.sort { $0 > $1 }
        print(keys)
        
        
        for sortKey in keys {
            for (key, value) in testDict {
                if sortKey == key {
                    print(value)
                }
            }
        }
        
    }
    
    func shuffle(){
        
        //シャッフル
        testDict.shuffled()
        
        
    }
    
    
    func read(){
        
        //        keyで検索かけて同じやつを取得
        for i in 1..<7{
            if let val = testDict[i] {
                print("ポイントが同じやつ")
            } else {
                print("違うやつ")
            }
            
            
        }
        
        
        
    }
    
    
    
}

