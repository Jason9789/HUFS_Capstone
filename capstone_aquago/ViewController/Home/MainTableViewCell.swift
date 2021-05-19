//
//  MainTableViewCell.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/05/16.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    
    private let stackLabels: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.distribution = .equalSpacing
        s.spacing = 8
        
        return s
    }()
    
    let titleWaterTank: UILabel = {
        let lb = UILabel()
        lb.text = "수조이름"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.adjustsFontForContentSizeCategory = false
        return lb
    }()
    
    private let labelSlash: UILabel = {
        let lb = UILabel()
        lb.text = "/"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 20)
                lb.adjustsFontForContentSizeCategory = false
        return lb
    }()
    
    let titleFishSpecies: UILabel = {
        let lb = UILabel()
        lb.text = "어종"
        lb.textColor = UIColor(red: 78/255, green: 148/255, blue: 199/255, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.adjustsFontForContentSizeCategory = false
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
    
    private let stack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .center
        s.distribution = .fillProportionally
        s.spacing = 30
        return s
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
        configureSubCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("TableView Custom Cell >> init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        contentView.addSubview(stackLabels)
        
        contentView.addSubview(stack)
        stack.addArrangedSubview(stackLabels)
        stack.addArrangedSubview(imgSirenGreen)
        
        stackLabels.addArrangedSubview(titleWaterTank)
        stackLabels.addArrangedSubview(labelSlash)
        stackLabels.addArrangedSubview(titleFishSpecies)
    }
    
    private func configureSubCell() {
        
        stack.snp.makeConstraints {
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(8)
            $0.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(16)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-8)
        }
        
        stackLabels.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.bottom.equalToSuperview()
        }
    }
}
