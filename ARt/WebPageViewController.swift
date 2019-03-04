//
//  WebPageViewController.swift
//  ARt
//
//  Created by student on 2018/12/29.
//  Copyright © 2018年 pxy. All rights reserved.
//

import UIKit

class WebPageViewController: UIViewController, UIWebViewDelegate {
    var strurl:String!
    var webView:UIView!
    var btnBack : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        btnBack  = UIButton(frame: CGRect(x: 50, y:50, width: 30, height: 30))
        btnBack.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.7137254902, blue: 0.7294117647, alpha: 0.7153520976)
        btnBack.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
        btnBack.setTitle("X", for: .normal)
        btnBack.isEnabled = true
        btnBack.addTarget(self, action: #selector(btnBackAction), for: .touchDown)
        
        
        let webView = UIWebView(frame: UIScreen.main.bounds)
        
        let url = URL(string: strurl)
        let urlRequest = NSURLRequest(url: url!)
        webView.loadRequest(urlRequest as URLRequest)
        
        self.view.addSubview(webView)
        view.addSubview(btnBack)
        // Do any additional setup after loading the view.
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    @objc func btnBackAction(){
        
       self.navigationController?.popViewController(animated: true)
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
    


