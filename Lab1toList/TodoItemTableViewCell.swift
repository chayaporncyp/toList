//
//  TodoItemTableViewCell.swift
//  Lab1toList
//
//  Created by Chayaporn Chatchotikawong on 7/8/2562 BE.
//  Copyright © 2562 Chayaporn Chatchotikawong. All rights reserved.
//
import UIKit

protocol TodoItemTableViewCellDelegate: class {
    func didCheckTodoItem(cell: TodoItemTableViewCell)
}

class TodoItemTableViewCell: UITableViewCell {

    @IBOutlet weak var TodoItemImageView: UIImageView!
    @IBOutlet weak var TodoItemTitle: UILabel!
   
    var tapGestureRegcognizer : UITapGestureRecognizer!
    var delegate: TodoItemTableViewCellDelegate?
    
    func setupUI(todoItem: TodoItem){
        TodoItemTitle.text = todoItem.title
        if todoItem.isChecked{
            TodoItemImageView.image = #imageLiteral(resourceName: "black-check-box-with-white-check.png")
        }else{
            TodoItemImageView.image = #imageLiteral(resourceName: "uncheck-box")
        }
        tapGestureRegcognizer = UITapGestureRecognizer(target: self, action: #selector(todoImageViewTapped(sender:)))
        TodoItemImageView.gestureRecognizers = [tapGestureRegcognizer]
        
       
    }
    
    @objc func todoImageViewTapped(sender: Any){
        print("Image View is Tapped \(TodoItemTitle.text ?? "empty")")
        delegate?.didCheckTodoItem(cell: self)
    }
    
}
