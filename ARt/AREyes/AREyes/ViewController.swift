//
//  ViewController.swift
//  AREyes
//
//  Created by Ru Zhao on 2019/3/4.
//  Copyright © 2019年 xiaoshuo. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation
import AVKit
import CoreData

//悬浮按钮双击 委托实现

//悬浮按钮 单机委托实现




class ViewController: UIViewController,FloatDelegate{
    func singleClick() {
        <#code#>
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置为白色底色
        self.view.backgroundColor = UIColor.white
        
        //隐藏
        self.navigationController?.navigationBar.isHidden = true
    }


}

