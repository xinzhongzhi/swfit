//
//  AreaTableViewController.swift
//  funsArea - swfit
//
//  Created by 辛忠志 on 2018/1/12.
//  Copyright © 2018年 xinzhongzhi. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {
  
    
    /*创建数组*/
    var areas = ["沈阳市","长春市","吉林市","广州市","成都市","北京市","长沙市","武汉市"]
    /*创建同一种类型的数组 eg:创建相同类型bool类型 false 创建了11 个*/
    var visited = [Bool](repeatElement(false, count: 11))
    /*创建数组图片*/
    var areasPic = ["pic2","pic","pic2","pic","pic2","pic","pic2","pic"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("您点击了",indexPath.section,"组",indexPath.row,"行")
        
//        /*弹出试图*/
//        let ac = UIAlertController (title: "提示", message: "您选择了第\(indexPath.row+1)行", preferredStyle: .alert)
//        let btn = UIAlertAction(title: "确定", style: .default) { (_) in
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
//        let btn1 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//        let btn2 = UIAlertAction(title: "删除", style: .destructive, handler: nil)
//        /*按钮加到控制器中*/
//        ac.addAction(btn)
//        ac.addAction(btn1)
//        ac.addAction(btn2)
//        self.present(ac, animated: true, completion: nil)
//        
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        /*把cell的点击赋值*/
//        self.visited[indexPath.row] = true
        
    }
    
    /*自定义删除cell 如果自定义删除一旦实现 系统删除将不再执行*/
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let actionShare = UITableViewRowAction(style: .normal, title: "分享") { (_, indexPath) in
            let actionSheet = UIAlertController(title: "分享", message: nil, preferredStyle:.actionSheet)
            let option = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option1 = UIAlertAction(title: "微信", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            /*按钮加到控制器中*/
            actionSheet.addAction(option)
            actionSheet.addAction(option1)
            actionSheet.addAction(option2)
            self.present(actionSheet, animated: true, completion: nil)
        }
        /*设置颜色*/
        actionShare.backgroundColor = UIColor(red: 245/255, green: 199/255, blue: 221/255, alpha: 1)
        
        let actionDel = UITableViewRowAction(style: .destructive, title: "删除") { (_, indexPath) in
            /*进行删除之后 需要同步数据把 数据源当中所有的数组 全部删除即可*/
            self.areasPic.remove(at: indexPath.row)
            self.areas.remove(at: indexPath.row)
            self.visited.remove(at: indexPath.row)
            /*起到动画的作用 不加会导致重复删除崩溃*/
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let shareBtn = UITableViewRowAction(style: .destructive, title: "置顶") { (_, indexPath) in
            print("置顶成功")
        }
        shareBtn.backgroundColor = UIColor .orange
        
        return [actionShare,actionDel,shareBtn]
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!CustomTableViewCell
        /*赋值操作*/
        cell.nameLabel?.text = areas[indexPath.row]
        cell.detailLabel.text = areas[indexPath.row]
        cell.fontLabel.text = areas[indexPath.row]
        
        cell.headImageView?.image = UIImage(named: areasPic[indexPath.row])
        /*判断cell的点击状态*/
        if visited[indexPath.row] {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        /*简洁写法 三元表达式*/
//        cell.accessoryType = self.visited[indexPath.row] ?.checkmark:.none
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    /*删除*/
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            /*进行删除之后 需要同步数据把 数据源当中所有的数组 全部删除即可*/
            self.areasPic.remove(at: indexPath.row)
            self.areas.remove(at: indexPath.row)
            self.visited.remove(at: indexPath.row)
            /*起到动画的作用 不加会导致重复删除崩溃*/
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*专场之前做的事情*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        /*
         1、确认是由指定的segue触发
         2、获取转场的目标控制器、并转换成具体的类
         3、设置 目标控制器的属性
         */
        if segue.identifier == "showAreaDetail"{
            let dest = segue.destination as!AreaDetailViewController
            dest.areaName = areasPic[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    
}
