//
//  VC2.swift
//  ARt
//
//  Created by student on 2018/12/26.
//  Copyright © 2018年 pxy. All rights reserved.
//

import UIKit

class VC2: UIViewController {
    var imageView: UIImageView!
    var image:UIImage!
    
    let Width = 768
    let Height = 1024
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        
       //监视设备方向 UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(receivedRotation), name: UIDevice.orientationDidChangeNotification, object: nil)
 
        
        imageView = UIImageView(frame: CGRect(x: 0, y: (Height-600)/2, width: Width, height: 600))
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
