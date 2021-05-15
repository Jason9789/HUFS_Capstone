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
    
    
    //MARK:- Private
    private let bag = DisposeBag()
    
    private let btnLogout: UIButton = {
        let b = UIButton()
        var img: UIImage = UIImage(named: "ico-logout")!
        b.setImage(img, for: .normal)
        return b
    }()
    
    private let btnAddFolder: UIButton = {
        let b = UIButton()
        if let img: UIImage = UIImage(named: "ico-folder-add") {
            b.setImage(img, for: .normal)
        }
        
        return b
    }()
    
    private let Logo: UIButton = {
        let b = UIButton()
        if let img: UIImage = UIImage(named: "Logo-bold") {
            b.setImage(img, for: .normal)
        }
        
        return b
    }()
    
    private let stackLabels: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.distribution = .equalSpacing
        s.spacing = 8
        
        return s
    }()
    
    private let titleWaterTank: UILabel = {
        let lb = UILabel()
        lb.text = "수조이름"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        return lb
    }()
    
    private let labelShash: UILabel = {
        let lb = UILabel()
        lb.text = "/"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        return lb
    }()
    
    private let titleFishSpecies: UILabel = {
        let lb = UILabel()
        lb.text = "어종"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        return lb
    }()
    
    private let imgSirenGreen: UIImageView = {
        let iv = UIImageView()
        var img = UIImage(named: "ico-siren-green")
        iv.image = img
        iv.snp.makeConstraints {
            $0.height.width.equalTo(70)
        }
        return iv
    }()
    
    private let imgSirenRed: UIImageView = {
        let iv = UIImageView()
        var img = UIImage(named: "ico-siren-red")
        iv.image = img
        iv.snp.makeConstraints {
            $0.height.width.equalTo(70)
        }
        return iv
    }()
    
    private let stack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .center
        s.distribution = .fillProportionally
        s.spacing = 30
        return s
    }()
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        configureView()
        configureSubView()
        bindRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK:- ConfigureView
    private func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(btnLogout)
        view.addSubview(btnAddFolder)
        view.addSubview(Logo)
        view.addSubview(stack)
        
        stack.addArrangedSubview(stackLabels)
        stack.addArrangedSubview(imgSirenGreen)
        
        stackLabels.addArrangedSubview(titleWaterTank)
        stackLabels.addArrangedSubview(labelShash)
        stackLabels.addArrangedSubview(titleFishSpecies)

    }
    
    //MARK:- Configure SubView
    private func configureSubView() {
        
        btnLogout.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(8)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
        }
        
        btnAddFolder.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-8)
        }
        
        Logo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        
        stack.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(8)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(161)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-8)
        }
            
        stackLabels.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.bottom.equalToSuperview()
        }

    }
    
    //MARK:- BindRx
    private func bindRx() {
        
        btnLogout.rx
            .tap
            .bind {
                self.dismiss(animated: true, completion: nil)
            }.disposed(by: bag)
        
        btnAddFolder.rx
            .tap
            .bind {
                print("add folder")
            }.disposed(by: bag)
    }
}
