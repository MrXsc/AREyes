//
//  ViewController.swift
//  ARt
//
//  Created by student on 2018/12/26.
//  Copyright © 2018年 pxy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate ,FloatDelegate {
    
    //悬浮按钮的 委托实现
    func singleClick() {
        print("单机")
        
    }
    
    func repeatClick() {
        print("双击")
    }
    

    var pages  = [MyViewController]()
    var image:UIImage!
    var AuthorIDs:[Int:String] = [0:"Leonardo da Vinci",1:"Vincent van Gogh",2:"Johannes Vermeer",3:"Hieronymus Bosch",4:"Titian (Tiziano Vecellio)"]
    var PictureIDs:[Int:String] = [0:"Mona Lisa",1:"Starry Night",2:"Girl with a Pearl Earring",3:"Adoration of the Magi",4:"Christ on the Cross",5:"The Last Supper"]
    var dicforauthor:[Int:Int] = [0:0,1:1,2:2,3:3,4:4,5:0]
    let Width = 1024.0
    let Height = 768.0
    
    var size:Int!//scroll的长度
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //监视设备方向
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(receivedRotation), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        
        size = PictureIDs.count
        let scrollview = UIScrollView()
        scrollview.delegate = self
        scrollview.frame = self.view.bounds
        scrollview.contentSize = CGSize(width: Width*(Double)(size), height: Height) //默认从最左边开始
        scrollview.isPagingEnabled = true
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.scrollsToTop = false
        for i in 0..<size{
            let myviewcontroller = MyViewController(initNumber: (i+1), initstrPicture: PictureIDs[i]!,initstrAuthor:AuthorIDs[dicforauthor[i]!]!)
            myviewcontroller.view.frame = CGRect(x: Width*(Double)(i), y: 0, width: Width, height: Height)
            scrollview.addSubview(myviewcontroller.view)
            pages.append(myviewcontroller)
            
        }
        image = UIImage(named: PictureIDs[0]!)
        self.view.addSubview(scrollview)
        
        
        let frame = CGRect.init(x: 3, y: 100, width: 30, height: 30)
        let allbutton = AllFloatButton.init(frame: frame)
        allbutton.imageView?.image = UIImage(named: "renjijiaohu")
        allbutton.delegate = self
        self.view.addSubview(allbutton)
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let result = (Int)((Double)(scrollView.contentOffset.x) / Width)
        image = UIImage(named: PictureIDs[result]!)
    }
    
    @objc func receivedRotation(){
        let device = UIDevice.current
        switch device.orientation {
        case .portrait:
            let vc = VC2()
            vc.image = image
            present(vc, animated: true, completion: nil)
        case .portraitUpsideDown:
            let vc = VC2()
            vc.image = image
            present(vc, animated: true, completion: nil)
        default:
            break

        }
    }

}

