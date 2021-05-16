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
    
    var tankData = [ModelWaterTank]()
    
    private let textTank = ["우럭울어", "광어미쳐"]
    private let textFish = ["우럭", "광어"]
    
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
    
    private let tableViewTankList: UITableView = {
        let tv = UITableView()
        tv.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tv.separatorStyle = .none
        return tv
    }()
    
    private let stackLabels: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.distribution = .equalSpacing
        s.spacing = 8
        
        return s
    }()
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        makeData()
        configureView()
        configureSubView()
        bindRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func makeData() {
        for i in 0...1 {
            tankData.append(ModelWaterTank.init(
                                titleWaterTank: textTank[i],
                                titleFish: textFish[i])
            )
            
            print(tankData)
        }
    }
    
    //MARK:- ConfigureView
    private func configureView() {
        view.backgroundColor = .white
        
        self.tableViewTankList.delegate = self
        self.tableViewTankList.dataSource = self
        self.tableViewTankList.rowHeight = 100
        
        view.addSubview(btnLogout)
        view.addSubview(btnAddFolder)
        view.addSubview(Logo)
        
        self.tableViewTankList.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableViewTankList)

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
        
        tableViewTankList.snp.makeConstraints {
            $0.top.equalTo(Logo.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
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
            .bind { [weak self] in
                let addTank = AddTankViewcontroller()
                self?.present(addTank, animated: true, completion: nil)
            }.disposed(by: bag)
    }
}


//MARK:- TableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(textTank[indexPath.row])
    }
}

//MARK:- TableView DataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tankData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewTankList.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        cell.titleWaterTank.text = tankData[indexPath.row].titleWaterTank ?? ""
        cell.titleFishSpecies.text = tankData[indexPath.row].titleFish ?? ""
        
        return cell
    }


}
