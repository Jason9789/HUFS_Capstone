//
//  InfoViewController.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/05/15.
//

import UIKit
import SnapKit

class InfoViewcontroller: UIViewController {
    
    //MARK:- Private
    
    private let btnHome: UIButton = {
        let b = UIButton()
        var img: UIImage = UIImage(named: "ico-home")!
        b.setImage(img, for: .normal)
        return b
    }()
    
    private let btnEdit: UIButton = {
        let b = UIButton()
        var img: UIImage = UIImage(named: "ico-edit")!
        b.setImage(img, for: .normal)
        return b
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
    
    private let stackLabels: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.distribution = .equalSpacing
        s.spacing = 8
        
        return s
    }()
    
    private let titleCreated: UILabel = {
        let lb = UILabel()
        lb.text = "생성 날짜 : 2021 - 03 - 31"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        return lb
    }()
    
    private let titleWaterTank: UILabel = {
        let lb = UILabel()
        lb.text = "수조이름"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        return lb
    }()
    
    private let labelSlash: UILabel = {
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
    
    private let lineView: UIView = {
        let v = UIView()
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1).cgColor
        v.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        return v
    }()
    
    private let lineView2: UIView = {
        let v = UIView()
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1).cgColor
        v.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        return v
    }()
    
    private let lineView3: UIView = {
        let v = UIView()
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1).cgColor
        v.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        return v
    }()
    
    /// DO
    private let titleDO: UILabel = {
        let lb = UILabel()
        lb.text = "용존산소량(DO)"
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        return lb
    }()
    
    private let imgDO: UIImageView = {
        let iv = UIImageView()
        var img = UIImage(named: "ico-do")
        iv.image = img
        iv.snp.makeConstraints {
            $0.height.width.equalTo(25)
        }
        return iv
    }()
    
    private let labelValueDO: UILabel = {
        let lb = UILabel()
        lb.text = "16.5"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        return lb
    }()
    
    private let labelUnitDO: UILabel = {
        let lb = UILabel()
        lb.text = "mg/L"
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        return lb
    }()
    
    /// PH
    private let titlePH: UILabel = {
        let lb = UILabel()
        lb.text = "PH"
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        return lb
    }()
    
    private let imgPH: UIImageView = {
        let iv = UIImageView()
        var img = UIImage(named: "ico-do")
        iv.image = img
        iv.snp.makeConstraints {
            $0.height.width.equalTo(25)
        }
        return iv
    }()
    
    private let labelValuePH: UILabel = {
        let lb = UILabel()
        lb.text = "8.0"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        return lb
    }()
    
    private let labelUnitPH: UILabel = {
        let lb = UILabel()
        lb.text = "ph"
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        return lb
    }()
    
    /// 수온
    private let titleTemp: UILabel = {
        let lb = UILabel()
        lb.text = "수온"
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        return lb
    }()
    
    private let imgTemp: UIImageView = {
        let iv = UIImageView()
        var img = UIImage(named: "ico-do")
        iv.image = img
        iv.snp.makeConstraints {
            $0.height.width.equalTo(25)
        }
        return iv
    }()
    
    private let labelValueTemp: UILabel = {
        let lb = UILabel()
        lb.text = "37.5"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        return lb
    }()
    
    private let labelUnitTemp: UILabel = {
        let lb = UILabel()
        lb.text = "°C"
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        return lb
    }()
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        print("Info")
        configureView()
        configureSubView()
    }
    
    //MARK:- Configure View
    
    private func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(btnHome)
        view.addSubview(btnEdit)
        view.addSubview(imgSirenGreen)
        view.addSubview(stackLabels)
        
        stackLabels.addArrangedSubview(titleWaterTank)
        stackLabels.addArrangedSubview(labelSlash)
        stackLabels.addArrangedSubview(titleFishSpecies)
        
        view.addSubview(titleCreated)
        
        view.addSubview(titleDO)
        view.addSubview(imgDO)
        view.addSubview(labelValueDO)
        view.addSubview(labelUnitDO)
        view.addSubview(lineView)
        
        view.addSubview(titlePH)
        view.addSubview(imgPH)
        view.addSubview(labelValuePH)
        view.addSubview(labelUnitPH)
        view.addSubview(lineView2)
        
        view.addSubview(titleTemp)
        view.addSubview(imgTemp)
        view.addSubview(labelValueTemp)
        view.addSubview(labelUnitTemp)
        view.addSubview(lineView3)
    }
    
    //MARK:- Configure SubView
    private func configureSubView() {
        
        btnHome.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(8)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
        }
        
        btnEdit.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-8)
        }
        
        imgSirenGreen.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(58)
            $0.centerX.equalToSuperview()
        }
        
        stackLabels.snp.makeConstraints {
            $0.top.equalTo(imgSirenGreen.snp.bottom).offset(40)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(50)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-50)
        }
        
        titleCreated.snp.makeConstraints {
            $0.top.equalTo(stackLabels.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        /// DO
        titleDO.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(22)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(290)
        }
        
        imgDO.snp.makeConstraints {
            $0.leading.equalTo(titleDO.snp.trailing).offset(8)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(295)
        }
        
        labelValueDO.snp.makeConstraints {
            $0.top.equalTo(imgDO.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        labelUnitDO.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(370)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-76)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(labelUnitDO.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        /// PH
        titlePH.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(22)
            $0.top.equalTo(lineView.snp.bottom).offset(20)
        }
        
        imgPH.snp.makeConstraints {
            $0.leading.equalTo(titlePH.snp.trailing).offset(8)
            $0.top.equalTo(lineView.snp.bottom).offset(20)
        }
        
        labelValuePH.snp.makeConstraints {
            $0.top.equalTo(imgPH.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        labelUnitPH.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(93)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-76)
        }
        
        lineView2.snp.makeConstraints {
            $0.top.equalTo(labelUnitPH.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        /// 수온
        titleTemp.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(22)
            $0.top.equalTo(lineView2.snp.bottom).offset(20)
        }
        
        imgTemp.snp.makeConstraints {
            $0.leading.equalTo(titleTemp.snp.trailing).offset(8)
            $0.top.equalTo(lineView2.snp.bottom).offset(20)
        }
        
        labelValueTemp.snp.makeConstraints {
            $0.top.equalTo(imgTemp.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        labelUnitTemp.snp.makeConstraints {
            $0.top.equalTo(lineView2.snp.bottom).offset(93)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-76)
        }
        
        lineView3.snp.makeConstraints {
            $0.top.equalTo(labelUnitTemp.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
}
