//
//  DetailViewController.swift
//  Lab1toList
//
//  Created by Chayaporn Chatchotikawong on 8/8/2562 BE.
//  Copyright © 2562 Chayaporn Chatchotikawong. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak private var titleLabel: UILabel!
    var item: String = ""
    
    @IBAction func didTapButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle(title: item)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setTitle(title: String){
        titleLabel.text = title
     //   self.item = title
    }
}
