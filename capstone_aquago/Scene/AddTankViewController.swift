//
//  AddTankViewController.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/05/15.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class AddTankViewcontroller: UIViewController {
    
    //MARK:- Private
    private let labelTitle: UILabel = {
        let lb = UILabel()
        lb.text = "수조 추가"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 50)
        return lb
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
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        print("TANK")
        configureView()
        configureSubView()
    }
    
    private func configureView() {
        self.view.backgroundColor = .white
        
        view.addSubview(labelTitle)
        view.addSubview(lineView)
    }
    
    private func configureSubView() {
        
        labelTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(labelTitle.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(60)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-60)
        }
        
    }
}
