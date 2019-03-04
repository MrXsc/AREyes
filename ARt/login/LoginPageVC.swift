//
//  LoginPageVC.swift
//  ARt
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 pxy. All rights reserved.
//

import UIKit

class LoginPageVC: UIViewController {
    
    //var k:transfer?
    
    // 回退
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true) {
            
        }
    }
    @IBAction func RegisterBtn(_ sender: UIButton) {
        let storyboard1 = UIStoryboard(name: "Main", bundle: Bundle.main)
        let RegisterPage = storyboard1.instantiateViewController(withIdentifier: "RegisterPage")
        print(RegisterPage)
        self.present(RegisterPage, animated: true, completion: nil)
    }
    var postStr : String?
    var username : String?
    var password : String?
    var loginsuccuss: Bool = false
    
    //
    @IBOutlet weak var usernameTF: UITextField!
    
    //
    @IBOutlet weak var passwordTF: UITextField!
    
    //
    @IBAction func loginButton(_ sender: UIButton) {
        username = usernameTF.text
        password = passwordTF.text
        //调用
        if usernameTF.text?.count != 0 && passwordTF.text?.count != 0{
            let alertC = UIAlertController(title: "正在登录中...", message: nil, preferredStyle: UIAlertController.Style.alert)
            self .present(alertC, animated: false, completion: nil)
            Request() .requestToken { (token, error) in
                if error == nil {
                    print(token ?? "token")
                    
                    //存储
                    UserDefaults.standard .set(token, forKey: "token")
                    //注册
                    //拼接参数
                    self.postStr = "username=\(self.username!)&pwd=\(self.password!)"
                    print(self.postStr!)
                    
                    Request() .requestDataWithPost(urlStr: "http://www.scxxhs.com/weizhu/appapi/user.php?act=do_login", postparams:
                        self.postStr!, completionHandler: { (dic, error) in
                            if error == nil {
                                //注册结果
                                
                                DispatchQueue.main.async {
                                    if dic!["code"] as! Int == 200 {
                                        self.loginsuccuss = true
                                        //self.k?.change(str: self.username!)
                                        print(self.username!)
                                        self.dismiss(animated: true, completion: nil)
                                        alertC.dismiss(animated: false, completion:nil)
                                        let alertB = UIAlertController(title: "登录成功", message: nil, preferredStyle: UIAlertController.Style.alert)
                                        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
                                            action in
                                            self.dismiss(animated: true, completion:nil)
                                            
                                        })
                                        alertB.addAction(okAction)
                                        self .present(alertB, animated: false, completion: nil)
                                        
                                    }
                                    if dic!["code"] as! Int == -1 {
                                        alertC.dismiss(animated: false, completion:nil)
                                        let alertB = UIAlertController(title: "登陆失败", message: "密码错误", preferredStyle: UIAlertController.Style.alert)
                                        let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
                                        alertB.addAction(okAction)
                                        self .present(alertB, animated: false, completion: nil)
                                    }
                                }
                                
                            }else{
                                DispatchQueue.main.async {
                                    alertC .dismiss(animated: false, completion: nil)
                                    alertC.dismiss(animated: false, completion:nil)
                                    let alertB = UIAlertController(title: "登陆失败", message: "登陆出问题了", preferredStyle: UIAlertController.Style.alert)
                                    let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
                                    alertB.addAction(okAction)
                                    self .present(alertB, animated: false, completion: nil)
                                }
                            }
                            
                    })
                }else{
                    alertC.dismiss(animated: false, completion:nil)
                    let alertB = UIAlertController(title: "登录失败", message: "登录出问题了", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
                    alertB.addAction(okAction)
                    self .present(alertB, animated: false, completion: nil)
                }
            }
        }else {
            let alertB = UIAlertController(title: "登录失败", message: "登录出问题了", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
            alertB.addAction(okAction)
            self .present(alertB, animated: false, completion: nil)
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
