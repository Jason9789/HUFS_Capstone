//
//  ViewController.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/04/12.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

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
        
        return tf
    }()
    
    let login: UIButton = {
        let btn = UIButton()
        btn.setTitle("들어가기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        btn.layer.cornerRadius = 10.0
        
        return btn
    }()
    
    let guide: UILabel = {
        let lb = UILabel()
        lb.text = "아직 계정이 없으신가요?"
        lb.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        
        return lb
    }()
    
    let signup: UIButton = {
        let btn = UIButton()
        btn.setTitle("회원가입", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitleColor(.black, for: .normal)
        
        return btn
    }()
    
    let stack:  UIStackView = {
        let st = UIStackView()
        
        st.spacing = 10.0
        st.axis = .horizontal
        
        return st
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        self.view.backgroundColor = .white
        self.view.addSubview(logo)
        self.view.addSubview(idText)
        self.view.addSubview(idTextField)
        self.view.addSubview(pwText)
        self.view.addSubview(pwTextField)
        self.view.addSubview(login)
        self.view.addSubview(stack)
        
        stack.addArrangedSubview(guide)
        stack.addArrangedSubview(signup)
        
        logo.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(70)
            make.left.equalTo(self.view).offset(37)
            make.right.equalTo(self.view).offset(-37)
        }
        
        idText.snp.makeConstraints { (make) in
            make.top.equalTo(logo.snp.bottom).offset(100)
            make.left.equalTo(self.view).offset(30)
        }
        
        idTextField.snp.makeConstraints { (make) in
            make.top.equalTo(idText.snp.bottom).offset(10)
            make.left.equalTo(self.view).offset(30)
            make.right.equalTo(self.view).offset(-30)
            make.height.equalTo(45)
        }
        
        pwText.snp.makeConstraints { (make) in
            make.top.equalTo(idTextField.snp.bottom).offset(40)
            make.left.equalTo(self.view).offset(37)
        }
        
        pwTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pwText.snp.bottom).offset(10)
            make.left.equalTo(self.view).offset(30)
            make.right.equalTo(self.view).offset(-30)
            make.height.equalTo(45)
        }
        
        login.snp.makeConstraints { (make) in
            make.top.equalTo(pwTextField.snp.bottom).offset(53)
            make.centerX.equalTo(self.view)
            make.height.equalTo(54)
            make.width.equalTo(221)
        }
        
        stack.snp.makeConstraints { (make) in
            make.top.equalTo(login.snp.bottom).offset(62)
            make.centerX.equalTo(self.view)
        }
    }
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

