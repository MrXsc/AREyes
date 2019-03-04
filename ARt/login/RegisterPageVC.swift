//
//  RegisterPageVC.swift
//  ARt
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 pxy. All rights reserved.
//

import UIKit

class RegisterPageVC: UIViewController {
    @IBOutlet weak var username: UITextField!
    var postStr : String?
    
    @IBOutlet weak var password: UITextField!
    var usernameTF : String?
    var pwdTF : String?
    
    @IBAction func register(_ sender: UIButton) {
        //  let un = username.text
        //   let pw = password.text
        
        usernameTF = username.text
        pwdTF = password.text
        //调用
        if username.text?.count != 0 && password.text?.count != 0{
            let alertC = UIAlertController(title: "正在注册中...", message: nil, preferredStyle: UIAlertController.Style.alert)
            self .present(alertC, animated: false, completion: nil)
            Request() .requestToken { (token, error) in
                if error == nil {
                    print(token ?? "token")
                    
                    //存储
                    UserDefaults.standard .set(token, forKey: "token")
                    //注册
                    //拼接参数
                    self.postStr = "Submit=立即注册&username=\(self.usernameTF!)&password=\(self.pwdTF!)"
                    print(self.postStr!)
                    
                    Request() .requestDataWithPost(urlStr: "http://www.scxxhs.com/weizhu/appapi/user.php?act=act_register", postparams:
                        self.postStr!, completionHandler: { (dic, error) in
                            if error == nil {
                                //注册结果
                                DispatchQueue.main.async {
                                    if dic!["code"] as! Int == 200 {
                                        alertC.dismiss(animated: false, completion:nil)
                                        let alertB = UIAlertController(title: "注册成功", message: nil, preferredStyle: UIAlertController.Style.alert)
                                        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
                                            action in
                                            self.dismiss(animated: true, completion:nil)
                                            
                                        })
                                        alertB.addAction(okAction)
                                        self .present(alertB, animated: false, completion: nil)
                                        
                                    }
                                    if dic!["code"] as! Int == -1 {
                                        alertC.dismiss(animated: false, completion:nil)
                                        let alertB = UIAlertController(title: "注册失败", message: "账号已注册", preferredStyle: UIAlertController.Style.alert)
                                        let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
                                        alertB.addAction(okAction)
                                        self .present(alertB, animated: false, completion: nil)
                                    }
                                }
                                
                            }else{
                                DispatchQueue.main.async {
                                    alertC .dismiss(animated: false, completion: nil)
                                    alertC.dismiss(animated: false, completion:nil)
                                    let alertB = UIAlertController(title: "注册失败", message: "注册出问题了", preferredStyle: UIAlertController.Style.alert)
                                    let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
                                    alertB.addAction(okAction)
                                    self .present(alertB, animated: false, completion: nil)
                                }
                            }
                            
                    })
                }else{
                    alertC.dismiss(animated: false, completion:nil)
                    let alertB = UIAlertController(title: "注册失败", message: "注册出问题了", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
                    alertB.addAction(okAction)
                    self .present(alertB, animated: false, completion: nil)
                }
            }
        }else {
            let alertB = UIAlertController(title: "注册失败", message: "注册出问题了", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
            alertB.addAction(okAction)
            self .present(alertB, animated: false, completion: nil)
        }
        
    }
    
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true) {
            
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
