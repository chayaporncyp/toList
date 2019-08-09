//
//  ViewController.swift
//  Lab1toList
//
//  Created by Chayaporn Chatchotikawong on 7/8/2562 BE.
//  Copyright © 2562 Chayaporn Chatchotikawong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var tabelView: UITableView!
    
    
    var todoList: [TodoItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func todoImageViewTapped(_ sender: Any) {
        print("aa")
    }
    
    @IBAction func addItem(_ sender: Any) {
        if let newTodoListItemTitle = todoTextField.text, !newTodoListItemTitle.isEmpty {
            let newTodoItem: TodoItem = TodoItem(title: newTodoListItemTitle, isChecked: false)
            todoList.append(newTodoItem)
            todoTextField.text = nil
            print(todoList)
            tabelView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard  todoList.indices.contains(indexPath.row) ,
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath) as? TodoItemTableViewCell else {
            print("ERERERERERERERER")
            return UITableViewCell()
        }
        
       let todoItem = todoList[indexPath.row]
        cell.setupUI(todoItem: todoItem)
        cell.delegate = self
        return cell
        
    }
    
    
}

extension ViewController: TodoItemTableViewCellDelegate{
    func didCheckTodoItem(cell: TodoItemTableViewCell) {
        if let index = tabelView.indexPath(for: cell){
            let todoItem = todoList.remove(at: index.row)
            let newTodoItem = TodoItem(title: todoItem.title, isChecked: !todoItem.isChecked)
            //todoList.remove(at: index.row)
            todoList.insert(newTodoItem, at: index.row)
            tabelView.reloadData()
            
        }
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else{
            return
        }
        
        let item = todoList[indexPath.item].title
        detailViewController.item = item
        self.present(detailViewController, animated: true, completion: nil)
//        self.present(detailViewController, animated: true){
//            detailViewController.setTitle(title: item)
//
//        }
    }
}
