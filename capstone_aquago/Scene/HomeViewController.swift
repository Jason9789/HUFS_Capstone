//
//  HomeViewController.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/05/15.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    private let bag = DisposeBag()
    
    let btnLogout: UIButton = {
        let b = UIButton()
        var img: UIImage = UIImage(named: "ico-logout")!
        b.setImage(img, for: .normal)
        return b
    }()
    
    override func viewDidLoad() {
        configureView()
        configureSubView()
        bindRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(btnLogout)
    }
    
    private func configureSubView() {
        
        btnLogout.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(8)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
        }
    }
    
    private func bindRx() {
        
        btnLogout.rx
            .tap
            .bind {
                self.dismiss(animated: true, completion: nil)
            }.disposed(by: bag)
    }
}
