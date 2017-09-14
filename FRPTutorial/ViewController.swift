//
//  ViewController.swift
//  FRPTutorial
//
//  Created by Julia on 11/11/16.
//  Copyright © 2016 Make school. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
 
    var name: String = "Eddie"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func changeNameButtonTapped(_ sender: AnyObject) {
        print("changeNameButtonTapped")
        showAlertController()
    
    }
    
    
    func showAlertController() {
        let title = "Update Name"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        //핸들러 정의
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            if let textInput = alert.textFields?.first?.text {
                self.name = textInput
                self.nameLabel.text = self.name
            }
        }
        
        //핸들러 추가
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        alert.addTextField()  //입력창 추가
        
        //화면 표시
        present(alert, animated: true)
    }

    
    
}

