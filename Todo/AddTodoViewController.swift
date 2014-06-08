//
//  AddTodoViewController.swift
//  Todo
//
//  Created by yuta on 2014/06/08.
//  Copyright (c) 2014年 yuta. All rights reserved.
//

import UIKit
/*
@objc(ViewController) class ViewController: UIViewController {
    
    @IBAction func saveTodo(s:UIStoryboardSegue) {
        println("hello world");
        self.performSegueWithIdentifier("backTodoSegue", sender: self)
    }
    
}
*/

class AddTodoViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var todoTextField : UITextField

    @IBOutlet var durationTextField : UITextField
    
    @IBOutlet var deadLineDatePicker : UIDatePicker
    
    var todoName = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        todoTextField.delegate = self
        durationTextField.delegate = self
        
        
    }
    
    @IBAction func didEndOnExitTodo(sender : AnyObject) {
    }
    
    @IBAction func didEndOnExitDuration(sender : AnyObject) {
    }
    
    @IBAction func save(sender : AnyObject) {
        
        if todoTextField.text.isEmpty{
            let alertView: UIAlertView = UIAlertView()
            alertView.title = "エラー"
            alertView.message = "Todoが入力されていません"
            alertView.addButtonWithTitle("閉じる")
            alertView.show();
            
            return
        }
        
        if durationTextField.text.isEmpty{
            let alertView: UIAlertView = UIAlertView()
            alertView.title = "エラー"
            alertView.message = "Durationが入力されていません"
            alertView.addButtonWithTitle("閉じる")
            alertView.show();
            
            return
        }
        
        
        // データ保存
        // Entityを追加
        let TodoData: Todo = Todo.MR_createEntity() as Todo
        TodoData.title = todoTextField.text
        TodoData.duration = durationTextField.text.toInt()!
        TodoData.deadline = deadLineDatePicker.date
        TodoData.updateDate = NSDate.date()
        
        // CoreDataに保存する（永続化）
        TodoData.managedObjectContext.MR_saveToPersistentStoreAndWait()
        
        
        // TodoListに戻る
        self.navigationController.popViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "backTodoSegue" {
            println("segueee")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
