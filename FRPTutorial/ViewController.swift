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
 
    //원래: var name: String = "Eddie"
    
    //수정: 아래처럼 Variable 타입으로 선언함
    let name: Variable<String> = Variable("Eddie")
    let disposableBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.asObservable()
            .bindTo(nameLabel.rx.text)
            .addDisposableTo(disposableBag)

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
                
                //원래:
                //self.name = textInput
                //self.nameLabel.text = self.name
                
                
                //수정:  입력된 텍스트로 value 속성을 바꾸자!!!
                self.name.value = textInput
                
            }
        }
        
        //핸들러 추가
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        alert.addTextField()
        
        //화면 표시
        present(alert, animated: true)
    }

    
    
}

