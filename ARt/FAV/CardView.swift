//
//  CardUIView.swift
//  ARt
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 pxy. All rights reserved.
//

import UIKit

class CardView: UIView {
    public var containerView: UIView!
    
    
    //图片
    
    public var imageview: UIImageView!
    public var image:UIImage!
    
    
    
    //信息
    
    public var InfoView :UIView!
    
    public var labelname: UILabel!
    
    public var line1: UIView!
    
    public var btnauthor: UIButton!
    
    public var line2: UIView!
    
    public var labelbirth: UILabel!
    
    private var strAuthor:String!
    private var strPicture:String!
    private var number: Int!
    
    private var Width = CGFloat(276.0)// 276
    private var Height = CGFloat(0)
    
    init(frame: CGRect,initstrPicture:String,initstrAuthor:String) {
        super.init(frame:frame)
        self.strPicture = initstrPicture
        self.strAuthor = initstrAuthor
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func commonInit() -> Void{
        self.containerView = UIView()
        
        self.imageview = UIImageView()// 星空图
        
        self.InfoView = UIView(frame: CGRect(x: 0, y: 0, width: 276, height: 138))
        
        self.labelname = UILabel(frame: CGRect(x: 34, y: 4, width: 208, height: 60))//     星空 字
        
        self.line1 = UIView(frame: CGRect(x: 38, y: 66, width: 200, height: 1))//----------------------
        
        self.btnauthor = UIButton(frame: CGRect(x: 38, y: 72, width: 200, height: 21))//     梵高
        
        self.line2 = UIView(frame: CGRect(x: 38, y: 101, width: 200, height: 1)) //----------------------
        
        self.labelbirth = UILabel(frame: CGRect(x: 38, y: 107, width: 200, height: 21))//     1998
     
        
       
        self.addSubview(imageview)
   
        InfoView.addSubview(labelname)
        InfoView.addSubview(line1)
        InfoView.addSubview(btnauthor)
        InfoView.addSubview(line2)
        InfoView.addSubview(labelbirth)
        
        self.addSubview(InfoView)
  
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor.white
        containerView.frame = CGRect(x: 0, y: 0, width: 888, height: 710)
        
        self.image = UIImage(named: strPicture)
        let pw = image.size.width
        var ph = image.size.height
        
        ph = (ph * 276.0) / pw
        imageview.frame = CGRect(x: 0, y: 0, width: 276, height: ph)
        imageview.image = image
        
        
        // frame set
        self.frame.size.height = ph + 138
        
        //INfoView set
        self.InfoView.frame.origin.y = ph
        
        labelname.text = strPicture
        labelname.textColor = UIColor.black
        labelname.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.black)
        labelname.textAlignment = NSTextAlignment.center
        
        
        line1.backgroundColor = UIColor.black
        
        
        btnauthor.setTitle(strAuthor, for: .normal)
        btnauthor.setTitleColor(#colorLiteral(red: 0.9354599118, green: 0.5228376389, blue: 0.5655869842, alpha: 1), for: .normal)
        
        line2.backgroundColor = UIColor.black
        
        
        labelbirth.text = "1888 - 1890"
        labelbirth.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        labelbirth.textAlignment = NSTextAlignment.center
        self.InfoView.backgroundColor = UIColor.white
        
        
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    

}
