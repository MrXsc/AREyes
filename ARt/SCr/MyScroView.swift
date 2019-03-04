//
//  MyScroView.swift
//  CustomerView
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 pxy. All rights reserved.
//

import UIKit

class MyScroView: UIView {
    public var containerView: UIView!
    public var labeldate:  UILabel!
    public var labelname: UILabel!
    public var line1: UIView!
    public var btnauthor: UIButton!
    public var line2: UIView!
    public var labelbirth: UILabel!
    
    private var items = ["AR","SEEN","LOVE","SHARE"]
    public var select: UISegmentedControl!
    public var textview: UITextView!

    
    public var imageFaView :UIView! //  imageview 的 父亲
    public var imageview: UIImageView!
    public var image:UIImage!
    
    private var strdate:String!
    private var strD:String!
    private var strAuthor:String!
    private var strPicture:String!
    private var number: Int!
    
    private let Width = 1024.0
    private let Height = 768.0
    
    init(frame: CGRect,initstrPicture:String,initstrAuthor:String,initstrdate:String,initstrD:String) {
        super.init(frame:frame)
        self.strPicture = initstrPicture
        self.strAuthor = initstrAuthor
        self.strdate = initstrdate
        self.strD = initstrD
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
        self.imageFaView = UIView()
        self.imageview = UIImageView()
        self.labeldate = UILabel()
        self.labelname = UILabel()
        self.line1 = UIView()
        self.btnauthor = UIButton()
        self.line2 = UIView()
        self.labelbirth = UILabel()
        self.select = UISegmentedControl(items: self.items)
        self.textview = UITextView()
        
        self.addSubview(imageFaView)
        imageFaView.addSubview(imageview)
        
        self.addSubview(labeldate)
        self.addSubview(labelname)
        self.addSubview(line1)
        self.addSubview(btnauthor)
        self.addSubview(line2)
        self.addSubview(labelbirth)
        self.addSubview(select)
        self.addSubview(textview)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let basewidth = 0.3*Width
        let basex = Width-basewidth
        containerView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        
        imageFaView.frame = CGRect(x: 0, y: 0, width: 0.7*Width, height: Height)
        imageFaView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        // MARK : 此处使用ipad 9.7 所以 0.7*Width =716.8  Height = 768
        // 适配图片
        let artImage = UIImage(named: strPicture)
        
        let pw = artImage?.size.width
        let ph = artImage?.size.height
        if( (pw!/ph!)<(716.8/768)){
           
            imageview.frame = CGRect(x: Double((716.8-pw!/ph!*768)/2), y: 0.0, width:  Double(pw!/ph!*768), height: Height)
        }else{
            
            imageview.frame = CGRect(x: 0.0, y: (768-716.8*ph!/pw!)/2, width: 716.8, height: 716.8*ph!/pw!)
        }
        
        //imageview.frame = CGRect(x: 0, y: 0, width: 0.7*Width, height: Height)
        
        imageview.image = artImage
        
        labeldate.frame = CGRect(x: basex, y: 15, width: basewidth, height: 25)
        labeldate.text = strD
        labeldate.textColor = UIColor.black
        labeldate.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        labeldate.textAlignment = NSTextAlignment.center
        
        labelname.frame = CGRect(x: basex, y: 50, width: basewidth, height: 35)
        labelname.text = strPicture
        labelname.textColor = UIColor.black
        labelname.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.black)
        labelname.textAlignment = NSTextAlignment.center
        
        line1.frame = CGRect(x: basex+(basewidth-200)/2, y: 95, width: 200, height: 2)
        line1.backgroundColor = UIColor.black
        
        btnauthor.frame = CGRect(x: basex, y: 100, width: basewidth, height: 25)
        btnauthor.setTitle(strAuthor, for: .normal)
        btnauthor.setTitleColor(UIColor.purple, for: .normal)
        
        line2.frame = CGRect(x: basex+(basewidth-200)/2, y: 128, width: 200, height: 2)
        line2.backgroundColor = UIColor.black
        
        labelbirth.frame = CGRect(x: basex, y: 134, width: basewidth, height: 25)
        labelbirth.text = strdate
        labelbirth.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        labelbirth.textAlignment = NSTextAlignment.center
        
        select.frame = CGRect(x: basex+10, y: 160, width: basewidth-20, height: 25)
        select.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.7254901961, blue: 0.7333333333, alpha: 1)
        select.tintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        textview.frame = CGRect(x: basex+10, y:200, width: basewidth-20, height: Height-210)
        textview.text = " In mid-March 1888 van Gogh writes of the weather and that the almond trees are coming into full flower, \"The weather here is changeable, often windy with turbulent skies, but the almond trees are beginning to flower everywhere.\"[13]Mancoff says of flowering trees and this work,\"In his flowering trees, Vincent attained a sense of spontaneity, freeing himself from the strict self-analytical approach he took in Paris. In Almond Tree in Blossom, Vincent used the light, broken strokes of impressionism and the dabs of colour of divisionism for a sparkling surface effect. The distinctive contours of the tree and its position in the foreground recall the formal qualities of Japanese prints.\"The rendering of Almond Blossom is positioned close and accessible to the viewer and the branches appear to reach out beyond the painting's frame. Theo wrote to his brother Vincent on January 31, 1890 to announce the birth of his son, Vincent Willem van Gogh. As a means of celebration, Vincent began work on a painting for Theo and his wife. He was very close to his brother and he sought to symbolize new life in the flowers of the almond tree for the birth of baby Vincent.he composition is unlike any other of van Gogh's paintings. The branches of the almond tree seem to float against the blue sky and fill the picture plane.The close-up of the branches brings to mind Delacroix's proposition that \"even a part of a thing is kind of a complete entity in itself.\"Dark lines outline the branches. This is a feature that Van Gogh had admired in Japanese floral studies that, for example, may depict a portion of a stalk of bamboo in an empty space.The bright color is reflective of the paintings made in Arles and the transformational work van Gogh had on the still life genre.How glad I was when the news came... I should have greatly preferred him to call the boy after Father, of whom I have been thinking so much these days, instead of after me; but seeing it has now been done, I started right away to make a picture for him, to hang in their bedroom, big branches of white almond blossom against a blue sky"
        textview.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
        textview.textColor = UIColor.black
        textview.isEditable = false
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
