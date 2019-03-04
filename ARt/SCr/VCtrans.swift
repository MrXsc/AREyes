//
//  VCtrans.swift
//  CustomerView
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 pxy. All rights reserved.
//

import UIKit

class VCtrans: UIViewController {
    var imageView: UIImageView!
    var image:UIImage!
    
    let Width = 768
    let Height = 1024
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        
        //监视设备方向 UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(receivedRotation), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        // MARK : 此处使用ipad 9.7 所以 0.7*Width =716.8  Height = 768
        // 适配图片
        
        imageView = UIImageView()
        
        let pw = image?.size.width
        let ph = image?.size.height
        
        if( (pw!/ph!)<(768/1024)){

            imageView.frame = CGRect(x: Double((768-pw!/ph!*1024)/2), y: 0.0, width:  Double(pw!/ph!*1024), height: Double(Height))
        }else{

            imageView.frame = CGRect(x: 0.0, y: (1024-768*ph!/pw!)/2, width: 768, height: 768*ph!/pw!)
        }
        
        
       //imageView = UIImageView(frame: CGRect(x: 0, y: (Height-600)/2, width: Width, height: 600))
        imageView.image = image
        //imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        
        
    }
    @objc func receivedRotation(){
        let device = UIDevice.current
        switch device.orientation {
        case .landscapeRight:
            dismiss(animated: true, completion: nil)
        case .landscapeLeft:
            dismiss(animated: true, completion: nil)
        default: break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
