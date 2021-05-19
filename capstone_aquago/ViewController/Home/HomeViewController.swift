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
import Firebase
import FirebaseFirestore
import GoogleSignIn

class HomeViewController: UIViewController {
    
    var tankData = [ModelWaterTank]()
    
    private var listWaterTank = [String]()
    private var listFish = [String]()
    private var listDO = [Any]()
    private var listPH = [Any]()
    private var listRTD = [Any]()
    
    var paramWaterTank: String = ""
    var paramFish: String = ""
    var paramDO: String = ""
    var paramPH: String = ""
    var paramRTD: String = ""
    
    private let texts = [[String]]()
    
    private var db = Firestore.firestore()
    
    //MARK:- Private
    private let bag = DisposeBag()
    
//    let viewModel = TankListViewModel()
    let viewModel = AddTankViewModel()
    
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
        getData()
        configureView()
        configureSubView()
        bindRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("===== 정보 저장 =====")
        
        self.viewModel.input.tank
            .subscribe(onNext: {
                print($0 ?? "")
            }).disposed(by: bag)
    }
    
    private func makeData() {
//        for i in 0...1 {
//            tankData.append(ModelWaterTank.init(
//                                titleWaterTank: textTank[i],
//                                titleFish: textFish[i])
//            )
//
//            print(tankData)
//        }
        
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
    
    //MARK:- GetData
    private func getData() {

        print("---- GET DATA ----")
        
        let docRef = db.collection("groups").document("ncQoNWSPu5RgjCoe5Td5")
            .collection("fishFarms").document("QR2QqWiFlarZCaecisOo")
            .collection("moanas")
        
        docRef.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let count = querySnapshot!.documents.count
                print(count)
                
                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
                    
//                    print("===== document =====")
//                    print(document.get("sensor") ?? "")
                    print(document.get("sensor.DO") ?? "")
                    print(document.get("sensor.PH") ?? "")
                    print(document.get("sensor.RTD") ?? "")
                    
                    self.listFish.append(document.get("speciesName") as! String)
                    self.listWaterTank.append(document.get("tankName") as! String)
                    self.listDO.append(document.get("sensor.DO") as! Double)
                    self.listPH.append(document.get("sensor.PH") as! Double)
                    self.listRTD.append(document.get("sensor.RTD") as! Double)
                    
                    DispatchQueue.main.async {
                        self.tableViewTankList.reloadData()
                    }
                    
                    print("===== document end =====")
                }
            }
        }
        
        print("---- GET DATA END ----")
    }
    
    //MARK:- BindRx
    private func bindRx() {
        
        btnLogout.rx
            .tap
            .bind {
                self.dismiss(animated: true, completion: nil)
                
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
                
                
                print("LOGOUT")
            }.disposed(by: bag)
        
        btnAddFolder.rx
            .tap
            .bind { [weak self] in
                let addTank = AddTankViewcontroller()
                addTank.modalPresentationStyle = .fullScreen
                self?.present(addTank, animated: true, completion: nil)
            }.disposed(by: bag)
    }
}


//MARK:- TableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listWaterTank[indexPath.row])
        print(listFish[indexPath.row])
        print("DO : \(listDO[indexPath.row])")
        print("PH : \(listPH[indexPath.row])")
        print("온도 : \(listRTD[indexPath.row])")
        
        paramWaterTank = listWaterTank[indexPath.row]
        
        let infoVC = InfoViewcontroller()
        infoVC.titleWaterTank.text = listWaterTank[indexPath.row]
        infoVC.titleFishSpecies.text = listFish[indexPath.row]
        infoVC.labelValueDO.text = "\(listDO[indexPath.row])"
        infoVC.labelValuePH.text = "\(listPH[indexPath.row])"
        infoVC.labelValueTemp.text = "\(listRTD[indexPath.row])"
        
        self.present(infoVC, animated: true, completion: nil)
    }
}

//MARK:- TableView DataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listWaterTank.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewTankList.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.selectionStyle = .none
        
//        cell.titleWaterTank.text = tankData[indexPath.row].titleWaterTank ?? ""
//        cell.titleFishSpecies.text = tankData[indexPath.row].titleFish ?? ""
        
        cell.titleFishSpecies.text = listFish[indexPath.row]
        cell.titleWaterTank.text = listWaterTank[indexPath.row]
        
        return cell
    }


}
