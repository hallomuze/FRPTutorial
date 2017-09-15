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

        //name 변수를 옵져블하게 만들고
        //name 이 변경되면 ---> nameLabel도 변경되도록 바인딩한다
        //마지막으로 버린다(disposeBag)

        //observable 에 어떤 변화가 발생하면
        //observable 은 emit 한다......> 이렇게해서 미리 binded도ᅵ어있던 Label 에도 변호ᅡ가생김.
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

