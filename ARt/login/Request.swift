//
//  AppDelegate.swift
//  SuperLifeLife
//
//  Created by student on 2018/12/24.
//  Copyright © 2018年 group8. All rights reserved.
//

import UIKit

class Request: NSObject {
    
    //获取token网络请求
    func requestToken(completionHandler: @escaping (String?, Error?) -> Swift.Void) {
        //地址url
        let url = URL(string: "http://www.scxxhs.com/weizhu/appapi/index.php?act=gettoken")
        //初始化request
        let request = URLRequest(url: url!)
        //初始化session
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            //判断没有错误后开始处理数据
            if error ==  nil {
                do {
                    //json解析数据
                    let responseData: Dictionary<String, Any> = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary
                    //打印查看数据
                    // print(responseData)
                    completionHandler(responseData["token"] as? String, nil)
                } catch {
                    print("不是json格式或解析失败")
                }
            }else{
                print(error ?? "网络请求错误")
            }
        }
        //开始任务
        task.resume()
    }
    
    //封装Post请求接口
    func requestDataWithPost(urlStr: String, postparams: String, completionHandler: @escaping (Dictionary<String, Any>?, Error?) -> Swift.Void) {
        
        //获取token
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let urlString = urlStr + "&token=" + token
        let url = URL(string: urlString)
        // print(url)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        //post参数
        request.httpBody = postparams.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            //判断没有错误后开始处理数据
            if error ==  nil {
                do {
                    //json解析数据
                    let responseData: Dictionary<String, Any> = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary
                    //打印查看数据
                    //print(responseData)
                    completionHandler(responseData, nil)
                } catch {
                    print("不是json格式或解析失败")
                }
            }else{
                print(error ?? "网络请求错误")
            }
            
        }
        //开始请求
        task .resume()
        
    }
}
