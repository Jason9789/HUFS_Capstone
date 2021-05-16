//
//  EditViewController.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/05/15.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class EditViewController: UIViewController {
    
    //MARK:- Private
    
    private let labelTitle: UILabel = {
        let lb = UILabel()
        lb.text = "수정하기"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        return lb
    }()
    
    /// DO
    private let labelDO: UILabel = {
        let lb = UILabel()
        lb.text = "용존산소량(DO)"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()
    
    private let stackDO: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.spacing = 16
        s.alignment = .center
        s.distribution = .equalSpacing
        return s
    }()
    
    private let tfDOValueMin: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "최소"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        tf.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        return tf
    }()
    
    private let labelBetween: UILabel = {
        let lb = UILabel()
        lb.text = "~"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()
    
    private let tfDOValueMax: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "최대"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        tf.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        return tf
    }()
    
    /// PH
    private let labelPH: UILabel = {
        let lb = UILabel()
        lb.text = "PH"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()
    
    private let stackPH: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.spacing = 16
        s.alignment = .center
        s.distribution = .equalSpacing
        return s
    }()
    
    private let tfPHValueMin: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "최소"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        tf.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        return tf
    }()
    
    private let labelBetween2: UILabel = {
        let lb = UILabel()
        lb.text = "~"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()
    
    private let tfPHValueMax: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "최대"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        tf.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        return tf
    }()
    
    /// Temperature
    private let labelTemp: UILabel = {
        let lb = UILabel()
        lb.text = "수온"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()
    
    private let stackTemp: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.spacing = 16
        s.alignment = .center
        s.distribution = .equalSpacing
        return s
    }()
    
    private let tfTempValueMin: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "최소"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        tf.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        return tf
    }()
    
    private let labelBetween3: UILabel = {
        let lb = UILabel()
        lb.text = "~"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()
    
    private let tfTempValueMax: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "최대"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        tf.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        return tf
    }()
    
    private let lineView: UIView = {
        let v = UIView()
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1).cgColor
        v.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        return v
    }()
    
    private let labelTank: UILabel = {
        let lb = UILabel()
        lb.text = "수조 이름"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()
    
    private let tfTank: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "수조 이름"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        tf.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        return tf
    }()
    
    private let labelFish: UILabel = {
        let lb = UILabel()
        lb.text = "어종"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        return lb
    }()
    
    private let tfFish: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "수조 이름"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        tf.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        return tf
    }()
    
    private let btnEdit: UIButton = {
        let btn = UIButton()
        btn.setTitle("수정 완료", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        btn.layer.cornerRadius = 10.0
        
        return btn
    }()
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        print("Edit VC")
        configureView()
        configureSubView()
    }
    
    //MARK:- configureView
    private func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(labelTitle)
        
        view.addSubview(labelDO)
        view.addSubview(stackDO)
        stackDO.addArrangedSubview(tfDOValueMin)
        stackDO.addArrangedSubview(labelBetween)
        stackDO.addArrangedSubview(tfDOValueMax)
        
        view.addSubview(labelPH)
        view.addSubview(stackPH)
        stackPH.addArrangedSubview(tfPHValueMin)
        stackPH.addArrangedSubview(labelBetween2)
        stackPH.addArrangedSubview(tfPHValueMax)
        
        view.addSubview(labelTemp)
        view.addSubview(stackTemp)
        stackTemp.addArrangedSubview(tfTempValueMin)
        stackTemp.addArrangedSubview(labelBetween3)
        stackTemp.addArrangedSubview(tfTempValueMax)
        
        view.addSubview(lineView)
        
        view.addSubview(labelTank)
        view.addSubview(tfTank)
        
        view.addSubview(labelFish)
        view.addSubview(tfFish)
        
        view.addSubview(btnEdit)
    }
    
    //MARK:- configureSubView
    private func configureSubView() {
        
        labelTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalToSuperview()
        }
        
        labelDO.snp.makeConstraints {
            $0.top.equalTo(labelTitle.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        stackDO.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(labelDO.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        labelPH.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(stackDO.snp.bottom).offset(32)
        }
        
        stackPH.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(labelPH.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        labelTemp.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(stackPH.snp.bottom).offset(32)
        }

        stackTemp.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(labelTemp.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(stackTemp.snp.bottom).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        labelTank.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(lineView.snp.bottom).offset(30)
        }
        
        tfTank.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(labelTank.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        labelFish.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(tfTank.snp.bottom).offset(32)
        }
        
        tfFish.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(labelFish.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        btnEdit.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
            $0.width.equalTo(220)
            $0.height.equalTo(50)
        }
    }
}
