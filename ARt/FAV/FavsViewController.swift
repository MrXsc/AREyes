//
//  FavsViewController.swift
//  qq
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 xiaoshuo. All rights reserved.
//

import UIKit
import CoreData


struct Info {
    var author:String
    var picture:String
    var date:String  //add;
    var isseen:Int
    var isfavorite:Int
}




class FavsViewController: UIViewController , UIScrollViewDelegate{
    
    
    
    
    var arrInfo = [Info]() //MARK :存储从数据库中获得的数据
    var scrollView : UIScrollView!
    
    var cardArray = [CardView]()
    var AuthorArray = [CardView]()
    let card1 = CardView(frame: CGRect(x: 15, y: 15, width: 0, height: 0), initstrPicture: "Christ on the Cross.png", initstrAuthor: "Van")
    let Acard1 = ArtistView(frame: CGRect(x: 306, y: 15, width: 0, height: 0), initstrPicture: "Sq0", initstrAuthor: "Newton")
    let FavC1 = CardView(frame: CGRect(x: 597, y: 15, width: 0, height: 0), initstrPicture: "p3.jpeg", initstrAuthor: "Van")
    
    //MARK : 全部都用 cardview
    var CardsHeighArr = [Double](repeating: 0.0, count: 3) // 做 添加 card 管理的 数组 保存 每一列的 长度 ScrollManager
    
    //得到小的index
    func MinIndex()-> Int {
        var  min = 0
        if CardsHeighArr[min] > CardsHeighArr[1]{
            min = 1
        }
        if CardsHeighArr[min] > CardsHeighArr[2]{
            min = 2
        }
        return min
    }
    
    //得到大的index
    func MaxIndex()-> Int {
        var  Max = 0
        if CardsHeighArr[Max] < CardsHeighArr[1]{
            Max = 1
        }
        if CardsHeighArr[Max] < CardsHeighArr[2]{
            Max = 2
        }
        return Max
    }
    
    func ScrollManager() -> CGPoint{ // 得到坐标
        let min = MinIndex()
        var origin = CGPoint(x: 0, y: 0)
        if min == 0{
            origin.x = 15
            origin.y = CGFloat(CardsHeighArr[min] + 15)
        }
        if min == 1{
            origin.x = 306
            origin.y = CGFloat(CardsHeighArr[min] + 15)
        }
        if min == 2{
            origin.x = 597
            origin.y = CGFloat(CardsHeighArr[min] + 15)
        }
        
        return origin
    }
    
    //添加一个card
    func addViewCard(card: CardView){
        let origin = ScrollManager()   //得到下一个坐标
        let min = MinIndex()
        
        CardsHeighArr[min] += Double(CardsHeighArr[min]) + 15.0 + Double(card.frame.height)
        print(card.frame.height)
        // 设置数据
        //card.image = UIImage(named: info.picture)
        //card.labelbirth.text = info.author
        
        // 设置坐标
        card.frame.origin = origin
        let ScMaxH = CardsHeighArr[MaxIndex()]
        
        //增加宽度
        if scrollView.contentSize.height < CGFloat(ScMaxH){
            scrollView.contentSize.height = CGFloat(ScMaxH+500)
        }
        
        self.scrollView.addSubview(card)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //加载数据
//        Insert(author: "Leonardo da Vinci", picture: "Mona Lisa", date: "1503-1517",isseen: "0", isfavorite: "0")
//        Insert(author: "Vincent van Gogh", picture: "Starry Night",date:"around 1889",isseen: "0", isfavorite: "0")
//        Insert(author: "Johannes Vermeer", picture: "Girl with a Pearl Earring",date:"1665", isseen: "0", isfavorite: "0")
//        Insert(author: "Hieronymus Bosch", picture: "Adoration of the Magi", date:"1470-1510",isseen: "0", isfavorite: "0")
//        Insert(author: "Titian (Tiziano Vecellio)", picture: "Christ on the Cross", date:"1951",isseen: "0", isfavorite: "0")
//        Insert(author: "Leonardo da Vinci", picture: "The Last Supper", date:"1494-1498",isseen: "0", isfavorite: "0")
        
//        Updateforseen(picture: , isseen: )          //修改数据
//        Updateforfavorite(picture: , favorite: )        //修改数据
        
        GetData()   //加载数据
        let emptyFram = CGRect(x: 0, y: 0, width: 0, height: 0)
//        let cardtest1 = CardView(frame: emptyFram, initstrPicture: arrInfo[0].picture, initstrAuthor: arrInfo[0].author)
        for i in 0 ... arrInfo.count-1 {
            cardArray.append(CardView(frame: emptyFram, initstrPicture: arrInfo[i].picture, initstrAuthor: arrInfo[i].author))
        }
        
        
        for i in 0 ... arrInfo.count-1 {
            let card = CardView(frame: emptyFram, initstrPicture: arrInfo[i].author, initstrAuthor: arrInfo[i].picture)
            card.labelbirth.text = arrInfo[i].date
            AuthorArray.append(card)
            
        }
        
        // MARK : data
        
        
        
        
        scrollView = UIScrollView(frame: CGRect(x: 138, y: 60, width: 888, height: 710))
        scrollView.contentSize = CGSize(width: 888 , height: 2000)
        //可以上下滚动
        scrollView.isScrollEnabled = true
        //会滚到顶点
        scrollView.scrollsToTop = true
        //反弹效果
        scrollView.bounces = true
        //分页显示
        scrollView.isPagingEnabled = true
        //水平/垂直滚动条是否可见
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        //滚动条颜色
        scrollView.indicatorStyle = .white
        scrollView.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.9606431935)
        
        self.view.addSubview(scrollView)
        // scrollView.addSubview(card1)
        
        //默认出现display
        //MARK: 有错 ，但在 btnAction中可以实现, 暂时不管
//        for card in cardArray{
//            addViewCard(card: card)
//        }
        
        //scrollView.addSubview(TestLabel)
        //scrollView.addSubview(btnTest)
        
        // Do any additional setup after loading the view.
    }
    
    func loadSc()  {
        scrollView.contentSize = CGSize(width: 888 , height: 2000)
        //可以上下滚动
        scrollView.isScrollEnabled = true
        //会滚到顶点
        scrollView.scrollsToTop = true
        //反弹效果
        scrollView.bounces = true
        //分页显示
        scrollView.isPagingEnabled = true
        //水平/垂直滚动条是否可见
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        //滚动条颜色
        scrollView.indicatorStyle = .white
        scrollView.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.9606431935)
    }
    
    

    
    @IBAction func btnWords(_ sender: UIButton) {
        print("艺术作品")
    
        //清空
        //sender.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .focused)
       
        // 应该用数组
        // 切换
        _ = self.scrollView.subviews.map {
            $0.removeFromSuperview()
        }
       scrollView.contentSize = CGSize(width: 888 , height: 2000)
        CardsHeighArr[0] = 0
        CardsHeighArr[1] = 0
        CardsHeighArr[2] = 0
        for card in cardArray{
            addViewCard(card: card)
        }
        
      // scrollView.addSubview(card1)
        
       
    }
    
    @IBAction func btnArt(_ sender: UIButton) {
        print("作者")
        scrollView.contentSize = CGSize(width: 888 , height: 2000)
        CardsHeighArr[0] = 0
        CardsHeighArr[1] = 0
        CardsHeighArr[2] = 0
        // 应该用数组
        
        // 切换
        _ = self.scrollView.subviews.map {
            $0.removeFromSuperview()
        }
        for card in AuthorArray{
            addViewCard(card: card)
        }
        
    }
    
    @IBAction func btnNotSeen(_ sender: UIButton) {
        print("not seen")
        // 切换
        
        _ = self.scrollView.subviews.map {
            $0.removeFromSuperview()
        }
        scrollView.contentSize = CGSize(width: 888 , height: 2000)
        CardsHeighArr[0] = 0
        CardsHeighArr[1] = 0
        CardsHeighArr[2] = 0
        
        for i in 0 ... arrInfo.count-1 {
            if arrInfo[i].isseen == 0 {
                addViewCard(card: cardArray[i])
            }
        }
        //
        
    }
    @IBAction func BtnFav(_ sender: UIButton) {
        print("收藏")
        
        
        scrollView.contentSize = CGSize(width: 888 , height: 2000)
        CardsHeighArr[0] = 0
        CardsHeighArr[1] = 0
        CardsHeighArr[2] = 0
        
        
        // 应该用数组
        // 切换
        _ = self.scrollView.subviews.map {
            $0.removeFromSuperview()
        }
       // scrollView.addSubview(FavC1)
        for i in 0 ... arrInfo.count-1 {
            if arrInfo[i].isfavorite == 1 {
                addViewCard(card: cardArray[i])
            }
        }
    }
    
    
    // Back func
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true) {
            
        }
    }
    
    
    //------------------------------------------------------------------------------------------
    
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
                print(p.value(forKey: "date")!)
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
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}


