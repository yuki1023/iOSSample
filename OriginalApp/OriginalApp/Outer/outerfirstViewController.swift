//
//  outerfirstViewController.swift
//  OriginalApp
//
//  Created by 阿部亮哉 on 2021/01/27.
//

import UIKit
import EMTNeumorphicView

class outerfirstViewController: UIViewController {
    @IBOutlet var outerbutton: EMTNeumorphicButton!

    override func viewDidLoad() {
        super.viewDidLoad()

       outerbutton.layer.cornerRadius = 40
        outerbutton.neumorphicLayer?.depthType = .convex
        outerbutton.neumorphicLayer?.elementDepth = 10
        outerbutton.neumorphicLayer?.cornerType = .all
        outerbutton.neumorphicLayer?.elementBackgroundColor =
            view.backgroundColor?.cgColor as! CGColor
        
        
    }
    


}
