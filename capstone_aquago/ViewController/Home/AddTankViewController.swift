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
    
    private let bag = DisposeBag()
    
    private let viewModel = AddTankViewModel()
    
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
    
    private let labelWaterTank: UILabel = {
        let lb = UILabel()
        lb.text = "수조 이름"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        return lb
    }()
    
    private let labelFish: UILabel = {
        let lb = UILabel()
        lb.text = "어종"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        return lb
    }()
    
    private let tfWaterTank : UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "수조 이름"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        
        return tf
    }()
    
    private let tfFish : UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "어종"
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 10.0
        tf.layer.borderColor = CGColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        
        return tf
    }()
    
    private let btnAdd: UIButton = {
        let btn = UIButton()
        btn.setTitle("추가하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
        btn.layer.cornerRadius = 10.0
        
        return btn
    }()
    
    //MARK:- Lifecycle
    override func viewDidLoad() {

        configureView()
        configureSubView()
        bindRx()
    }
    
    
    //MARK:- ConfigureView
    private func configureView() {
        self.view.backgroundColor = .white
        
        view.addSubview(labelTitle)
        view.addSubview(lineView)
        
        view.addSubview(labelWaterTank)
        view.addSubview(tfWaterTank)
        
        view.addSubview(labelFish)
        view.addSubview(tfFish)
        
        view.addSubview(btnAdd)
    }
    
    
    //MARK:- configureSubView
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
        
        labelWaterTank.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(56)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        tfWaterTank.snp.makeConstraints {
            $0.top.equalTo(labelWaterTank.snp.bottom).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            $0.height.equalTo(45)
        }
        
        labelFish.snp.makeConstraints {
            $0.top.equalTo(tfWaterTank.snp.bottom).offset(100)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        tfFish.snp.makeConstraints {
            $0.top.equalTo(labelFish.snp.bottom).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            $0.height.equalTo(45)
        }
        
        btnAdd.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
            $0.width.equalTo(220)
            $0.height.equalTo(50)
        }
        
    }
    
    
    //MARK:- BindRx
    private func bindRx() {
        
        tfWaterTank.rx
            .text
            .orEmpty
            .changed
            .bind(to: viewModel.input.tank)
            .disposed(by: bag)
        
        tfWaterTank.rx
            .controlEvent(.editingDidEndOnExit)
            .bind { [weak self] in
                self?.tfFish.becomeFirstResponder()
            }
            .disposed(by: bag)
        
        tfFish.rx
            .text
            .orEmpty
            .changed
            .bind(to: viewModel.input.fish)
            .disposed(by: bag)
        
        btnAdd.rx
            .tap
            .bind(to: viewModel.input.nextButtonPressed)
            .disposed(by: bag)
        
        viewModel.output.isValid
            .subscribe(onNext: { [weak self] isValid in
                DispatchQueue.main.async {
                    
                    self?.btnAdd.isUserInteractionEnabled = isValid
                    
                    UIView.animate(withDuration: 0.2) {
                        
                        if isValid {
                            self?.btnAdd.backgroundColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1.0)
                        } else {
                            self?.btnAdd.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
                        }
                    }
                }
            })
            .disposed(by: bag)
        
        viewModel.output.isSaved
            .subscribe(onNext: { isSaved in
                print("saved")
                
                print("===== 정보 저장 =====")
                print("tank: \(self.viewModel.dependency.tank ?? "")")
                print("fish: \(self.viewModel.dependency.fish ?? "")")
                
                print(self.viewModel.input.tank)
                print(self.viewModel.input.fish)
                
                self.viewModel.input.tank.subscribe{ event in
                    print(event)
                    
                }.disposed(by: self.bag)
                
                print("SAVE")
                
                self.dismiss(animated: true, completion: nil)
            })
            .disposed(by: bag)
    }
}
