//
//  ViewController.swift
//  Todo
//
//  Created by yuta on 2014/06/07.
//  Copyright (c) 2014年 yuta. All rights reserved.
//

import UIKit

class ViewController : UITableViewController {
    
    // todo表示用Array
    var todoObjects = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("reloadData"), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadData()
    }
    
    func reloadData() {
        // データ取得
        todoObjects = Todo.MR_findAll()
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 100
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoObjects.count
    }
    @IBOutlet var timeLbl : UILabel
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "TodoCell")
        self.configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        
        cell.textLabel.text = todoObjects[indexPath.row].title
        cell.detailTextLabel.text = getDeadLine(todoObjects[indexPath.row].deadline)
        cell.textLabel.font = UIFont.systemFontOfSize(20.0)
        cell.textLabel.numberOfLines = 0
        cell.tag = indexPath.row
        
    }
    
    func getDeadLine(deadLineDate : NSDate) -> String {
        
        // 現在時間
        var now =  NSDate.date()
        
        // タスクの終了時間
        let futureDate = deadLineDate
        
        // 差分を計算
        let timeSinceNow = futureDate.timeIntervalSinceDate(now)
        
        // 時間取得
        var gapHour = Float(timeSinceNow/60/60)
        var fixedGapHour =  roundf(gapHour)
        var hour = Int(fixedGapHour)
        
        // 分取得
        var gapMinutes = Float(timeSinceNow/60%60)
        var fixedGapMinutes =  roundf(gapMinutes)
        var min = Int(fixedGapMinutes)
        
        // 分取得
        var gapSecond = Float(timeSinceNow%60)
        var fixedGapSecond =  roundf(gapSecond)
        var second = Int(fixedGapSecond)
        
        
        var deadLineStr = "残り \(hour):\(min):\(second)"
        
        
        return deadLineStr
    
    
    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // Entityの削除
            let todoObject: Todo = todoObjects[indexPath.row] as Todo
            todoObject.MR_deleteEntity()
            
            todoObject.managedObjectContext.MR_saveToPersistentStoreAndWait()
            
            todoObjects = Todo.MR_findAll()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    override func tableView(tableView: UITableView!, editingStyleForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCellEditingStyle {
        
        return UITableViewCellEditingStyle.Delete;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

