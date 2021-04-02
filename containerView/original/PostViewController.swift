//
//  PostViewController.swift
//  original
//
//  Created by 黒部麻由子 on 2020/09/07.
//  Copyright © 2020 mayukokurobe. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var containerA: UIView!
    @IBOutlet var containerB: UIView!
    @IBOutlet var containerC: UIView!
    
    var containers: Array<UIView> = []
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
         containers = [containerA,containerB,containerC]
            containerView.bringSubviewToFront(containerA)
        
      }

     // ③
       @IBAction func changeContainerView(_ sender: UISegmentedControl) {
            let currentContainerView = containers[sender.selectedSegmentIndex]
           containerView.bringSubviewToFront(currentContainerView)
           
    
       }
    
      
       }
    
    
    
    

