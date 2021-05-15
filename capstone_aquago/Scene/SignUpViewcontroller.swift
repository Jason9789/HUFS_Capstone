//
//  SignUpViewcontroller.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/05/13.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {

    private let bag = DisposeBag()
    
    let logo: UIImageView = {
        let lg = UIImageView()
        lg.image = UIImage(named: "Logo")
        
        return lg
    }()
    
    let idText: UILabel = {
        let lb = UILabel()
        lb.text = "아이디"
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        
        return lb
    }()
    
    let pwText: UILabel = {
        let lb = UILabel()
        lb.text = "비밀번호"
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        
        return lb
    }()
    
    let pwCheckText: UILabel = {
        let lb = UILabel()
        lb.text = "비밀번호 재확인"
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        
        return lb
    }()
    
    let idTextField: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "이메일"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        return tf
    }()
    
    let pwTextField: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "비밀번호"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let pwCheckTextField: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "비밀번호"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let signUp: UIButton = {
        let btn = UIButton()
        btn.setTitle("가입하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        btn.layer.cornerRadius = 10.0
        
        return btn
    }()
    
    
    
    let stack:  UIStackView = {
        let st = UIStackView()
        
        st.spacing = 10.0
        st.axis = .horizontal
        
        return st
    }()
    
    let labelQuestion: UILabel = {
        let lb = UILabel()
        lb.text = "계정이 있으신가요?"
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        return lb
    }()
    
    let btnBack: UIButton = {
        let btn = UIButton()
        btn.setTitle("돌아가기", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        bindRx()
    }
    
    private func initView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(logo)
        self.view.addSubview(idText)
        self.view.addSubview(idTextField)
        self.view.addSubview(pwText)
        self.view.addSubview(pwTextField)
        self.view.addSubview(pwCheckText)
        self.view.addSubview(pwCheckTextField)
        self.view.addSubview(signUp)
        
        self.view.addSubview(stack)
        stack.addArrangedSubview(labelQuestion)
        stack.addArrangedSubview(btnBack)
        
        logo.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(54)
            make.left.equalTo(self.view).offset(37)
            make.right.equalTo(self.view).offset(-37)
        }
        
        idText.snp.makeConstraints { (make) in
            make.top.equalTo(logo.snp.bottom).offset(38)
            make.left.equalTo(self.view).offset(31)
        }
        
        idTextField.snp.makeConstraints { (make) in
            make.top.equalTo(idText.snp.bottom).offset(5)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
        }
        
        pwText.snp.makeConstraints { (make) in
            make.top.equalTo(idTextField.snp.bottom).offset(27)
            make.left.equalTo(self.view).offset(38)
        }
        
        pwTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pwText.snp.bottom).offset(5)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
        }
        
        pwCheckText.snp.makeConstraints { (make) in
            make.top.equalTo(pwTextField.snp.bottom).offset(27)
            make.left.equalTo(self.view).offset(38)
        }
        
        pwCheckTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pwCheckText.snp.bottom).offset(5)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
        }
        
        signUp.snp.makeConstraints { (make) in
            make.top.equalTo(pwCheckTextField.snp.bottom).offset(53)
            make.centerX.equalTo(self.view)
            make.height.equalTo(54)
            make.width.equalTo(221)
        }
        
        stack.snp.makeConstraints {
            $0.top.equalTo(signUp.snp.bottom).offset(30)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func bindRx() {
        btnBack.rx
            .tap
            .bind {
                self.dismiss(animated: true, completion: nil)
            }.disposed(by: bag)
    }
}

