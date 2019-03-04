//
//  popMenuViewController.swift
//  ARt
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 pxy. All rights reserved.
//

import UIKit

class popMenuViewController: UIViewController  {
    var userPic :UIImageView!
    var btnToday: UIButton!
    var btnFavs: UIButton!
    var btnPic : UIButton!
    var btnLogin :UIButton!
    var btnDev :UIButton!
    var nav: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.7137254902, blue: 0.7294117647, alpha: 1)
        // Do any additional setup after loading the view.
        
        userPic = UIImageView(frame: CGRect(x: 46, y: 87, width: 100, height: 100))
        userPic.image = UIImage(named: "Sq0")
        userPic.layer.cornerRadius = userPic.frame.size.width / 2
        userPic.layer.masksToBounds = true
        
        btnToday = UIButton(frame: CGRect(x: 46, y: 334, width: 110, height: 30))
        btnToday.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnToday.setTitleColor(#colorLiteral(red: 0.4392156863, green: 0.5058823529, blue: 0.7058823529, alpha: 1), for: .normal)
        btnToday.setTitle("TODAY", for: .normal)
        btnToday.isEnabled = true
        btnToday.addTarget(self, action: #selector(btnTodayAction), for: .touchDown)
        
        
        btnFavs = UIButton(frame: CGRect(x: 46, y: 433, width: 110, height: 30))
        btnFavs.backgroundColor = #colorLiteral(red: 0.4235294118, green: 0.5058823529, blue: 0.7215686275, alpha: 1)
        btnFavs.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnFavs.setTitle("FAVS", for: .normal)
        btnFavs.isEnabled = true
        btnFavs.addTarget(self, action: #selector(btnFavsAction), for: .touchDown)
        
        
        btnDev = UIButton(frame: CGRect(x: 46, y: 532, width: 110, height: 30))
        btnDev.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnDev.setTitleColor(#colorLiteral(red: 0.4392156863, green: 0.5058823529, blue: 0.7058823529, alpha: 1), for: .normal)
        btnDev.setTitle("DEV", for: .normal)
        btnDev.isEnabled = true
        btnDev.addTarget(self, action: #selector(btnDEVAction), for: .touchDown)
        
        btnPic = UIButton(frame: CGRect(x: 46, y: 87, width: 100, height: 100))
        btnPic.setImage(UIImage(named: "Sq0"), for: .normal)
    
        btnPic.isEnabled = true
        btnPic.addTarget(self, action: #selector(btnPicAction), for: .touchDown)
        
        
        btnLogin = UIButton(frame: CGRect(x: 46, y: 187, width: 100, height: 30))
        btnLogin.setTitle("Log!n", for: .normal)
        btnLogin.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btnLogin.isEnabled = true
        btnLogin.addTarget(self, action: #selector(btnPicAction), for: .touchDown)
        
       
      
        view.addSubview(btnPic)
        view.addSubview(btnLogin)
        
        view.addSubview(btnToday)
        view.addSubview(btnFavs)
        
        view.addSubview(btnDev)
        
       // 假开关
        let btnFake  = UIButton(frame: CGRect(x: 46, y:600, width: 110, height: 30))
        btnFake.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.7137254902, blue: 0.7294117647, alpha: 1)
        btnFake.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btnFake.setTitle("X", for: .normal)
        btnFake.isEnabled = true
        btnFake.addTarget(self, action: #selector(btnTodayAction), for: .touchDown)
        view.addSubview(btnFake)
    }
    
    @objc func btnPicAction(){
        print("ddd")
        let storyboard1 = UIStoryboard(name: "Main", bundle: Bundle.main)
        let LoginPage = storyboard1.instantiateViewController(withIdentifier: "LoginPage")
        print(LoginPage)
        self.present(LoginPage, animated: true, completion: nil)
        
    }
    @objc func btnFavsAction(){
        print("f")
        
        let storyboard1 = UIStoryboard(name: "Main", bundle: Bundle.main)
        let FavsPage = storyboard1.instantiateViewController(withIdentifier: "FavsPage")
        print(FavsPage)
        self.present(FavsPage, animated: true, completion: nil)
        
    }
    @objc func btnTodayAction(){
        print("t")
        self.dismiss(animated: true) {
            
        }
        
    }
    @objc func btnDEVAction(){
        let storyboard1 = UIStoryboard(name: "Main", bundle: Bundle.main)
        let aboutDEVPage = storyboard1.instantiateViewController(withIdentifier: "aboutDEVPage")
        print(aboutDEVPage)
        self.present(aboutDEVPage, animated: true, completion: nil)

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
