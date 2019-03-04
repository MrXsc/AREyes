////
////  ViewController.swift
////  ARt
////
////  Created by student on 2018/12/26.
////  Copyright © 2018年 pxy. All rights reserved.
////
//
//
//import UIKit
//import SceneKit
//import ARKit
//import AVFoundation
//import AVKit
//import CoreData
//
//
//
//
//class ViewController: UIViewController,UIScrollViewDelegate ,FloatDelegate , UIPopoverPresentationControllerDelegate {
//
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//        return .none
//    }
//
//
//
//
//    //allbtn 的 委托实现
//    func singleClick() {
//        print("dj")
//
//        //读 mainstoryboard
//////        let LoginPage = storyboard?.instantiateViewController(withIdentifier: "LoginPage")
////        let storyboard1 = UIStoryboard(name: "Main", bundle: Bundle.main)
//////        print(storyboard1.instantiateViewController(withIdentifier: "LoginPage"))
////        let LoginPage = storyboard1.instantiateViewController(withIdentifier: "LoginPage")
////
////        self.navigationController?.pushViewController(LoginPage, animated: true)
//        let pop = popMenuViewController()
//        pop.modalPresentationStyle = .popover
//        pop.popoverPresentationController?.delegate = self
//        pop.popoverPresentationController?.sourceView = self.view
//        let menubound = CGRect(x: 0, y: 0, width: 0, height: 0)
//        pop.preferredContentSize = CGSize(width: 200, height: 700)
//        pop.popoverPresentationController?.permittedArrowDirections = .left
//        pop.popoverPresentationController?.sourceRect = menubound
//        self.present(pop, animated: true, completion: nil)
//
//    }
//
//    func repeatClick() {
//        if isPlay {
//            allbutton.player?.pause()
//            isPlay = false
//        }else{
//            allbutton.player?.play()
//            isPlay = true
//        }
//        print("双击")
//    }
//
//    var isPlay = true
//    var allbutton : AllFloatButton!
//    var scrollview:UIScrollView!
//    var image:UIImage!
//    var AuthorIDs:[Int:String] = [0:"Leonardo da Vinci",1:"Vincent van Gogh",2:"Johannes Vermeer",3:"Hieronymus Bosch",4:"Titian (Tiziano Vecellio)"]
//    var PictureIDs:[Int:String] = [0:"Mona Lisa",1:"Starry Night",2:"Girl with a Pearl Earring",3:"Adoration of the Magi",4:"Christ on the Cross",5:"The Last Supper"]
//    var dicforauthor:[Int:Int] = [0:0,1:1,2:2,3:3,4:4,5:0]
//
//
//    var arrurls:[String] = ["https://en.wikipedia.org/wiki/Leonardo_da_Vinci","https://en.wikipedia.org/wiki/Vincent_van_Gogh","https://en.wikipedia.org/wiki/Johannes_Vermeer","https://en.wikipedia.org/wiki/Hieronymus_Bosch","https://en.wikipedia.org/wiki/Titian",""]
//    var result = 0
//    var size:Int!
//    let Width = 1024.0
//    let Height = 768.0
//
//    // MARK : 隐藏状态栏 从而适配 viewController的 大小 实现无法上下
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //白色底色
//        self.view.backgroundColor = UIColor.white
//
//        //self.prefersStatusBarHidden
//
//
//
//        //监视设备方向
//        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
//        NotificationCenter.default.addObserver(self, selector: #selector(receivedRotation), name: UIDevice.orientationDidChangeNotification, object: nil)
//
//        size = PictureIDs.count
//        scrollview = UIScrollView()
//        scrollview.delegate = self
//        scrollview.frame = self.view.bounds
////        scrollview.bounces = false
//        scrollview.contentSize = CGSize(width: Width*(Double)(size), height: Height)
//        scrollview.isPagingEnabled = true
//        scrollview.showsHorizontalScrollIndicator = false
//        scrollview.showsVerticalScrollIndicator = false
//        scrollview.scrollsToTop = false
//        scrollview.isUserInteractionEnabled = true
//        for i in 0..<size{
//            let vc = MyScroView(frame: CGRect(x: Width*(Double)(i), y: 0, width: Width, height: Height), initstrPicture: PictureIDs[i]!, initstrAuthor: AuthorIDs[dicforauthor[i]!]!)
//            vc.frame = CGRect(x: Width*(Double)(i), y: 0, width: Width, height: Height)
//
//            vc.select.addTarget(self, action: #selector(selectAction(_:)), for: .valueChanged)  //添加目标动作方法
//            let longpressGesture = UILongPressGestureRecognizer()
//            longpressGesture.addTarget(self, action: #selector(longpressGestureAction(sender:)))
//            vc.btnauthor.addGestureRecognizer(longpressGesture)    //添加手势
//
//            scrollview.addSubview(vc)
//        }
//        self.view.addSubview(scrollview)
//        image = UIImage(named: PictureIDs[0]!)
//
//        let frame = CGRect.init(x: 50, y: 670, width: 50, height: 50)
//        allbutton = AllFloatButton.init(frame:frame)
//        allbutton.imageView?.image = UIImage(named: "renjijiaohu")
//        allbutton.delegate = self
//        self.view.addSubview(allbutton)
//
//        self.navigationController?.navigationBar.isHidden = true // 隐藏
//
//
//    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        result = (Int)((Double)(scrollView.contentOffset.x) / Width)
//        image = UIImage(named: PictureIDs[result]!)
//    }
//
//    //选择按钮
//
//    @objc func selectAction(_ sender:UISegmentedControl){
//        switch sender.selectedSegmentIndex {
//        case 0:
//            let artShow = ARtShowViewController()
//            artShow.arIndex = 0;
//
//           // self.navigationController?.navigationBar.isHidden = false
//        //  artShow.navigationController?.navigationBar.isHidden = false
//            self.navigationController?.pushViewController(artShow, animated: true)
//
//
//            break       //启动AR功能
//
//        case 1:
//
//            break       //标记为已读
//
//        case 2:
//            break       //标记为喜欢
//
//        case 3:
//
//            let items = [UIImage(named: PictureIDs[0]!)]
//            let activityVC = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
//            let popover = activityVC.popoverPresentationController
//            //从该View中弹出UIActivityViewController
//            popover?.sourceView = self.view
//            popover?.sourceRect = CGRect(x: Width/2-100, y:Height/2+25, width:200, height: 40)
//            popover?.permittedArrowDirections = UIPopoverArrowDirection.any
//            present(activityVC, animated: true)
//            break       //分享 xs： 系统分享
//
//        default:
//            break
//        }
//    }
//
//
//    //长按目标动作方法
//    @objc func longpressGestureAction(sender: UILongPressGestureRecognizer) {
//        if sender.state == UIGestureRecognizer.State.ended {
//            //显示作者详细信息
//            let vcDetail1 = WebPageViewController()
//            vcDetail1.strurl = arrurls[result]
//            self.navigationController?.pushViewController(vcDetail1, animated: true)
//
//        }
//    }
//
//    @objc func receivedRotation(){
//        let device = UIDevice.current
//        switch device.orientation {
//        case .portrait:
//            let vc = VCtrans()
//            vc.image = image
//            present(vc, animated: true, completion: nil)
//        case .portraitUpsideDown:
//            let vc = VCtrans()
//            vc.image = image
//            present(vc, animated: true, completion: nil)
//        default:
//            break
//        }
//    }
//}


//
//  ViewController.swift
//  ARt
//
//  Created by student on 2018/12/26.
//  Copyright © 2018年 pxy. All rights reserved.
//


import UIKit
import SceneKit
import ARKit
import AVFoundation
import AVKit
import CoreData


class ViewController: UIViewController,UIScrollViewDelegate ,FloatDelegate , UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    
    
    
    //allbtn 的 委托实现
    func singleClick() {
        print("dj")
        
        //读 mainstoryboard
        ////        let LoginPage = storyboard?.instantiateViewController(withIdentifier: "LoginPage")
        //        let storyboard1 = UIStoryboard(name: "Main", bundle: Bundle.main)
        ////        print(storyboard1.instantiateViewController(withIdentifier: "LoginPage"))
        //        let LoginPage = storyboard1.instantiateViewController(withIdentifier: "LoginPage")
        //
        //        self.navigationController?.pushViewController(LoginPage, animated: true)
        let pop = popMenuViewController()
        pop.modalPresentationStyle = .popover
        pop.popoverPresentationController?.delegate = self
        pop.popoverPresentationController?.sourceView = self.view
        let menubound = CGRect(x: 0, y: 0, width: 0, height: 0)
        pop.preferredContentSize = CGSize(width: 200, height: 700)
        pop.popoverPresentationController?.permittedArrowDirections = .left
        pop.popoverPresentationController?.sourceRect = menubound
        self.present(pop, animated: true, completion: nil)
        
    }
    
    func repeatClick() {
        if isPlay {
            allbutton.player?.pause()
            isPlay = false
        }else{
            allbutton.player?.play()
            isPlay = true
        }
        print("双击")
    }
    
    var isPlay = true
    var allbutton : AllFloatButton!
    var scrollview:UIScrollView!
    var image:UIImage!
    var arrInfo = [Info]()
    var arrurls:[String] = ["https://en.wikipedia.org/wiki/Leonardo_da_Vinci","https://en.wikipedia.org/wiki/Vincent_van_Gogh","https://en.wikipedia.org/wiki/Johannes_Vermeer","https://en.wikipedia.org/wiki/Hieronymus_Bosch","https://en.wikipedia.org/wiki/Titian",""]
    var result = 0
    var size:Int!
    let Width = 1024.0
    let Height = 768.0
    var isnew = true
    // MARK : 隐藏状态栏 从而d配 viewController的 大小 实现无法上下
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //白色底色
        self.view.backgroundColor = UIColor.white
        
        //self.prefersStatusBarHidden
        
//            Insert(author: "Leonardo da Vinci", picture: "Mona Lisa", date: "1503-1517",isseen: "0", isfavorite: "0")
//            Insert(author: "Vincent van Gogh", picture: "Starry Night",date:"around 1889",isseen: "0", isfavorite: "0")
//            Insert(author: "Johannes Vermeer", picture: "Girl with a Pearl Earring",date:"1665", isseen: "0", isfavorite: "0")
//            Insert(author: "Hieronymus Bosch", picture: "Adoration of the Magi", date:"1470-1510",isseen: "0", isfavorite: "0")
//            Insert(author: "Titian (Tiziano Vecellio)", picture: "Christ on the Cross", date:"1951",isseen: "0", isfavorite: "0")
//            Insert(author: "Leonardo da Vinci", picture: "The Last Supper", date:"1494-1498",isseen: "0", isfavorite: "0")
        
        
        
        
        
        
        Get()
        GetData()   //加载数据
        
        
        
        
        
        //监视设备方向
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(receivedRotation), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        size = arrInfo.count
        scrollview = UIScrollView()
        scrollview.delegate = self
        scrollview.frame = self.view.bounds
        //        scrollview.bounces = false
        scrollview.contentSize = CGSize(width: Width*(Double)(size), height: Height)
        scrollview.isPagingEnabled = true
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.scrollsToTop = false
        scrollview.isUserInteractionEnabled = true
        for i in 0..<size{
            var strD = ""
            if i == 0 {
                strD = "Today"
            }else if i == 1{
                strD = "Yesterday"
            }else{
                strD = "Forwards.."
            }
            let vc = MyScroView(frame: CGRect(x: Width*(Double)(i), y: 0, width: Width, height: Height), initstrPicture: arrInfo[i].picture, initstrAuthor: arrInfo[i].author,initstrdate:arrInfo[i].date,initstrD:strD)
            vc.frame = CGRect(x: Width*(Double)(i), y: 0, width: Width, height: Height)
            
            vc.select.addTarget(self, action: #selector(selectAction(_:)), for: .valueChanged)  //添加目标动作方法
            let longpressGesture = UILongPressGestureRecognizer()
            longpressGesture.addTarget(self, action: #selector(longpressGestureAction(sender:)))
            vc.btnauthor.addGestureRecognizer(longpressGesture)    //添加手势
            
            scrollview.addSubview(vc)
        }
        self.view.addSubview(scrollview)
        image = UIImage(named: arrInfo[0].picture)
        
        let frame = CGRect.init(x: 50, y: 670, width: 50, height: 50)
        allbutton = AllFloatButton.init(frame:frame)
        allbutton.imageView?.image = UIImage(named: "renjijiaohu")
        allbutton.delegate = self
        self.view.addSubview(allbutton)
        
        self.navigationController?.navigationBar.isHidden = true // 隐藏
        
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        result = (Int)((Double)(scrollView.contentOffset.x) / Width)
        image = UIImage(named: arrInfo[result].picture)
    }
    
    //选择按钮
    
    @objc func selectAction(_ sender:UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            let artShow = ARtShowViewController()
            artShow.arIndex = 0;
            
            // self.navigationController?.navigationBar.isHidden = false
            //  artShow.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(artShow, animated: true)
            
            
            break       //启动AR功能
            
        case 1:
            Updateforseen(picture: arrInfo[result].picture, isseen: 1)
            print("success")
            break       //标记为已读
            
        case 2:
            if arrInfo[result].isfavorite == 0{
                Updateforfavorite(picture: arrInfo[result].picture, favorite: 1)
            }else{
                Updateforfavorite(picture: arrInfo[result].picture, favorite: 0)
            }
            break       //标记为喜欢
            
        case 3:
            
            let items = [UIImage(named: arrInfo[result].picture)]
            let activityVC = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
            let popover = activityVC.popoverPresentationController
            //从该View中弹出UIActivityViewController
            popover?.sourceView = self.view
            popover?.sourceRect = CGRect(x: Width/2-100, y:Height/2+25, width:200, height: 40)
            popover?.permittedArrowDirections = UIPopoverArrowDirection.any
            present(activityVC, animated: true)
            break       //分享 xs： 系统分享
            
        default:
            break
        }
    }
    
    
    //长按目标动作方法
    @objc func longpressGestureAction(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.ended {
            //显示作者详细信息
            let vcDetail1 = WebPageViewController()
            vcDetail1.strurl = arrurls[result]
            self.navigationController?.pushViewController(vcDetail1, animated: true)
            
        }
    }
    
    
    
    // data
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func Insert(author:String,picture:String,date:String,isseen:String,isfavorite:String) {
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Info1", in: context)
        
        let person = NSManagedObject(entity: entity!, insertInto: context)
        person.setValue(author, forKey: "author")
        person.setValue(picture, forKey: "picture")
        person.setValue(date, forKey: "date")
        person.setValue(isseen, forKey: "isseen")
        person.setValue(isfavorite, forKey: "isfavorite")
        //        步骤四：保存entity到托管对象中。如果保存失败，进行处理
        do {
            try context.save()
        } catch  {
            fatalError("无法保存")
        }
    }
    
    func Get() {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Info1")
        
        //        步骤三：执行请求
        do {
            let fetchedResults = try context.fetch(fetchRequest)
            for p in (fetchedResults as! [NSManagedObject]){
                print(p.value(forKey: "isseen")!)
            }
            
        } catch  {
            fatalError("获取失败")
        }
    }
    
    func Delete(picture :String) {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Info1")
        
        do {
            let fetchedResults = try context.fetch(fetchRequest)
            for p in (fetchedResults as! [NSManagedObject]){
                let r = "\(p.value(forKey: "picture")!)"
                if  r == picture {
                    context.delete(p)
                    //p.setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
                }
            }
            
        } catch  {
            fatalError("获取失败")
        }
        
        do {
            try context.save()
        }catch {
            print("error")
        }
    }
    
    func DeletAll() {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Info1")
        
        do {
            let fetchedResults = try context.fetch(fetchRequest)
            for p in (fetchedResults as! [NSManagedObject]){
                context.delete(p)
            }
        }catch  {
            fatalError("获取失败")
        }
        
        do {
            try context.save()
        }catch {
            print("error")
        }
    }
    
    
    
    func GetData() {
        arrInfo.removeAll()
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Info1")
        
        //        步骤三：执行请求
        do {
            let fetchedResults = try context.fetch(fetchRequest)
            for p in (fetchedResults as! [NSManagedObject]){
                let a = "\(p.value(forKey: "author")!)"
                let pic = "\(p.value(forKey: "picture")!)"
                let d = "\(p.value(forKey: "date")!)"
                
                let s = "\(p.value(forKey: "isseen")!)"
                let ints = Int(s)!
                let f = "\(p.value(forKey: "isfavorite")!)"
                let intf = Int(f)!
                
                let infotemp = Info.init(author: a, picture: pic, date: d, isseen: ints, isfavorite: intf
                )
                arrInfo.append(infotemp)
                print("successful")
            }
            
        } catch  {
            fatalError("获取失败")
        }
    }
    
    
    func Updateforseen(picture :String,isseen:Int) {
        let count = arrInfo.count
        for i in 0..<count{
            if arrInfo[i].picture == picture{
                arrInfo[i].isseen = isseen
            }
        }
        DeletAll()
        SavetoDB()
    }
    
    func Updateforfavorite(picture :String,favorite:Int) {
        let count = arrInfo.count
        for i in 0..<count{
            if arrInfo[i].picture == picture{
                arrInfo[i].isfavorite = favorite
            }
        }
        DeletAll()
        SavetoDB()
    }
    
    func SavetoDB(){
        let count = arrInfo.count
        for i in 0..<count{
            Insert(author: arrInfo[i].author, picture: arrInfo[i].picture, date: arrInfo[i].date, isseen: "\(arrInfo[i].isseen)", isfavorite: "\(arrInfo[i].isfavorite)")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    @objc func receivedRotation(){
        let device = UIDevice.current
        switch device.orientation {
        case .portrait:
            let vc = VCtrans()
            vc.image = image
            present(vc, animated: true, completion: nil)
        case .portraitUpsideDown:
            let vc = VCtrans()
            vc.image = image
            present(vc, animated: true, completion: nil)
        default:
            break
        }
    }
}
