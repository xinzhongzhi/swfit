//
//  AreaDetailViewController.swift
//  funsArea - swfit
//
//  Created by 辛忠志 on 2018/1/12.
//  Copyright © 2018年 xinzhongzhi. All rights reserved.
//

import UIKit


class AreaDetailViewController: UIViewController {
    @IBOutlet weak var areaImageView: UIImageView!
    /*地址名称*/
    var areaName = ""
    

    enum Weather {
        case sunny
        case snow
        case froggy
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*转场进入详情页面 然后赋值*/
        self.areaImageView.image = UIImage(named: areaName)

        let cardno : Set = ["1","3","5"]
        
        var citys : Set = ["shanghai","beijing","hunan","hefei","jilin"]

        /*元素个数*/
        citys.count
        /*是否为nil*/
        cardno.isEmpty
        /*插入:insert*/
        citys.insert("guangzhou")
        /*移除*/
        citys.remove("shanghai")
        /*是否包含某个元素*/
        citys.contains("beijing")
        /*set 转化为数组*/
        let cityArr = citys.sorted()
        /*交际*/
        var x :Set = [1,3,2,4]
        let y :Set = [5,6,3,4]
        x.intersection(y)
        /*差际*/
        x.subtract(y)
        /*并际*/
        x.union(y)
        /*补际*/
        x.symmetricDifference(y)
        /*相等的元素*/
        x == y
        /*子集 isSubet(可以相等) 严格子集 isStrictSubset*/
        x.isSubset(of: y)
        x.isStrictSubset(of: y)
        /*父集 isSuperSet 严格父集 isStrictSuperSetOf*/
        x.isSuperset(of: y)
        x.isStrictSuperset(of: y)
        /*无交集*/
        let j :Set = ["动漫","游戏"]
        let k :Set = ["购物","小吃","化妆"]
        j.isDisjoint(with: k)
        
        /*字典*/
        var airPorts = ["PVG":"shanghai","CHU":"dalian","DUB":"dublin AirPoart"]
        /*字典个数*/
        print(airPorts.count)
        /*是否为空*/
        print(airPorts.isEmpty)
        /*字典 添加 元素*/
        airPorts["SHQ"] = "HongQiao Airport "
        airPorts["CHU"] = "大连周子水机场"
        /*获取*/
//        airPorts["PVG"]
        /*移除*/
        airPorts["DUB"] = nil
        /*遍历*/
        for (key,value) in airPorts {
            print(key,value)
        }
        /*遍历只打印key&value*/
        for key in airPorts.keys {
            print(key)
        }
        /*把key和value单独提取出来*/
        let codes = [String](airPorts.keys)
        let AirPoartName = [String](airPorts.values)
        print(codes)
        print(AirPoartName)
        

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//class 生命 {
//    class var 遗传方式 :String{
//        return "RNA"
//    }
//}
//
//生命.遗传方式
//
//class Human:生命 {
//    override class var 遗传方式 :String{
//        return "DNA"
//    }
//}
//
//print(Human.遗传方式)

