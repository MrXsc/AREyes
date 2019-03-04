//
//  ARtShowViewController.swift
//  ArtARFunction
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 xiaoshuo. All rights reserved.
//

import UIKit
import ARKit
import SceneKit


class ARtShowViewController: UIViewController ,ARSCNViewDelegate {
    var btnBack : UIButton!
    //必备
    let arSCNView = ARSCNView()
    let arSession = ARSession()
    let arConfiguration = ARWorldTrackingConfiguration()
    
    var arIndex = 0
    //图
    let ArtPicNode = SCNNode()
    
    let ArtPicHaloNode = SCNNode()//光晕
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.navigationController?.isNavigationBarHidden = false
        btnBack = UIButton(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        btnBack.setImage(UIImage(named: "ic_photo_camera_white-2"), for: .normal)
      //  btnBack.backgroundColor = UIColor.white
        btnBack.addTarget(self, action: #selector(btnBackAction), for: .touchDown)
        self.view.addSubview(btnBack)
        arConfiguration.isLightEstimationEnabled = true//自适应灯光（室內到室外的話 畫面會比較柔和）
        arSession.run(arConfiguration, options: [.removeExistingAnchors,.resetTracking])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        arSession.pause()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //设置arSCNView属性
        arSCNView.frame = self.view.frame
        
        arSCNView.session = arSession
        arSCNView.automaticallyUpdatesLighting = true//自动调节亮度
        
        self.view.addSubview(arSCNView)
        arSCNView.delegate = self
        
        self.initNode()
        self.addLight()
       
    }
    @objc func btnBackAction(){
        self.navigationController?.popViewController(animated: true)
    }
    //MARK:初始化节点信息
    func initNode()  {
        //1.设置几何
        //ArtPicNode.geometry = SCNSphere(radius: 3) //球形
        //图片
        var boxW: CGFloat = 6.59
        var boxH: CGFloat = 8.15
        let boxL: CGFloat = 0.15
        
        
        //创建一个长方体,用来展示图片
        ArtPicNode.geometry = SCNBox.init(width: boxW, height: boxH, length: boxL, chamferRadius: 0.1) //方形
        
        let imageA =  ["p0.jpeg","p1.jpeg","p2.jpeg"]
        
        ArtPicNode.geometry?.firstMaterial?.diffuse.contents = imageA[self.arIndex]
        ArtPicNode.geometry?.firstMaterial?.multiply.intensity = 0.5 //強度
        ArtPicNode.geometry?.firstMaterial?.lightingModel = SCNMaterial.LightingModel.constant
        
        
        //3.设置位置
        ArtPicNode.position = SCNVector3(0, 5, -20)
        //添加长方体到界面上
        self.arSCNView.scene.rootNode.addChildNode(ArtPicNode)
        
    }
    
    
    func addLight() {
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.color = UIColor.red //被光找到的地方颜色
        
        ArtPicNode.addChildNode(lightNode)
        lightNode.light?.attenuationEndDistance = 20.0 //光照的亮度随着距离改变
        lightNode.light?.attenuationStartDistance = 1.0
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 1
        lightNode.light?.color =  UIColor.white
        lightNode.opacity = 0.5 // make the halo stronger
        
        SCNTransaction.commit()
        ArtPicHaloNode.geometry = SCNPlane.init(width: 25, height: 25)
        
        ArtPicHaloNode.rotation = SCNVector4Make(1, 0, 0, Float(0 * Double.pi / 180.0))
        ArtPicHaloNode.geometry?.firstMaterial?.diffuse.contents = "sun-halo.png"
        ArtPicHaloNode.geometry?.firstMaterial?.lightingModel = SCNMaterial.LightingModel.constant // no lighting
        ArtPicHaloNode.geometry?.firstMaterial?.writesToDepthBuffer = false // 不要有厚度，看起来薄薄的一层
        ArtPicHaloNode.opacity = 5
        ArtPicHaloNode.addChildNode(ArtPicHaloNode)
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
