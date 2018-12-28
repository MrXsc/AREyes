//
//  MyViewController.swift
//  ARt
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 pxy. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    //左侧
    var imageview: UIImageView!
    var image:UIImage!
    
    //右侧
    var strAuthor:String!
    var strPicture:String!
    var number: Int!
    
    //9.7寸 pad
    let Width = 1024.0
    let Height = 768.0
    
    init(initNumber:Int,initstrPicture:String,initstrAuthor:String) {
        self.number = initNumber
        self.strPicture = initstrPicture
        self.strAuthor = initstrAuthor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("2333 failed!!!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //监视设备方向 MARK： xs： 可以不再myview 中设置监听
        //UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        //NotificationCenter.default.addObserver(self, selector: #selector(receivedRotation), name: UIDevice.orientationDidChangeNotification, object: nil)
        
                //加载视图
                image = UIImage(named: strPicture)
                //左半部分
                imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 0.7*Width, height: Height))
                imageview.image = image
                //bakimage.contentMode = .scaleAspectFill
                self.view.addSubview(imageview)
        
                //右半部分
                let basewidth = 0.3*Width
                let basex = Width-basewidth
        
        
                let labeldate = UILabel(frame: CGRect(x: basex, y: 15, width: basewidth, height: 25))
                labeldate.text = "Today"
                labeldate.textColor = UIColor.black
                labeldate.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
                labeldate.textAlignment = NSTextAlignment.center
                self.view.addSubview(labeldate)
        
                let labelname = UILabel(frame: CGRect(x: basex, y: 50, width: basewidth, height: 35))
                labelname.text = strPicture
                labelname.textColor = UIColor.black
                labelname.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.black)
                labelname.textAlignment = NSTextAlignment.center
                self.view.addSubview(labelname)
        
                let line1 = UIView(frame: CGRect(x: basex+(basewidth-200)/2, y: 95, width: 200, height: 2))
                line1.backgroundColor = UIColor.black
                self.view.addSubview(line1)
        
        
                let btnauthor = UIButton(frame: CGRect(x: basex, y: 100, width: basewidth, height: 25))
                btnauthor.setTitle(strAuthor, for: .normal)
                btnauthor.setTitleColor(UIColor.purple, for: .normal)
                btnauthor.adjustsImageWhenHighlighted = true
                btnauthor.addTarget(self, action: #selector(btnauthorAction), for: .touchDown)
                self.view.addSubview(btnauthor)
        
                let line2 = UIView(frame: CGRect(x: basex+(basewidth-200)/2, y: 128, width: 200, height: 2))
                line2.backgroundColor = UIColor.black
                self.view.addSubview(line2)
        
                let labelbirth = UILabel(frame: CGRect(x: basex, y: 130, width: basewidth, height: 25))
                labelbirth.text = "1888 - 1890"
                labelbirth.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
                labelbirth.textAlignment = NSTextAlignment.center
                self.view.addSubview(labelbirth)
        
                let textview = UITextView(frame: CGRect(x: basex+10, y:200, width: basewidth-10, height: Height-210))
                textview.text = " In mid-March 1888 van Gogh writes of the weather and that the almond trees are coming into full flower, \"The weather here is changeable, often windy with turbulent skies, but the almond trees are beginning to flower everywhere.\"[13]Mancoff says of flowering trees and this work,\"In his flowering trees, Vincent attained a sense of spontaneity, freeing himself from the strict self-analytical approach he took in Paris. In Almond Tree in Blossom, Vincent used the light, broken strokes of impressionism and the dabs of colour of divisionism for a sparkling surface effect. The distinctive contours of the tree and its position in the foreground recall the formal qualities of Japanese prints.\"The rendering of Almond Blossom is positioned close and accessible to the viewer and the branches appear to reach out beyond the painting's frame. Theo wrote to his brother Vincent on January 31, 1890 to announce the birth of his son, Vincent Willem van Gogh. As a means of celebration, Vincent began work on a painting for Theo and his wife. He was very close to his brother and he sought to symbolize new life in the flowers of the almond tree for the birth of baby Vincent.he composition is unlike any other of van Gogh's paintings. The branches of the almond tree seem to float against the blue sky and fill the picture plane.The close-up of the branches brings to mind Delacroix's proposition that \"even a part of a thing is kind of a complete entity in itself.\"Dark lines outline the branches. This is a feature that Van Gogh had admired in Japanese floral studies that, for example, may depict a portion of a stalk of bamboo in an empty space.The bright color is reflective of the paintings made in Arles and the transformational work van Gogh had on the still life genre.How glad I was when the news came... I should have greatly preferred him to call the boy after Father, of whom I have been thinking so much these days, instead of after me; but seeing it has now been done, I started right away to make a picture for him, to hang in their bedroom, big branches of white almond blossom against a blue sky"
        
                textview.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
                textview.textColor = UIColor.black
                textview.isEditable = false
                self.view.addSubview(textview)

    }
    
    //作者按钮
    @objc func btnauthorAction(){
        print("dfdd")
    }
    
    
    //
    @objc func receivedRotation(){
        let device = UIDevice.current
        switch device.orientation {
        case .portrait:
            let vc = VC2()
            vc.image = image
            present(vc, animated: false, completion: nil)
        case .portraitUpsideDown:
            let vc = VC2()
            vc.image = image
            present(vc, animated: false, completion: nil)
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
