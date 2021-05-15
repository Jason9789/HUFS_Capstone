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
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        print("Edit VC")
        configureView()
        configureSubView()
    }
    
    //MARK:- configureView
    private func configureView() {
        view.backgroundColor = .white
    }
    
    //MARK:- configureSubView
    private func configureSubView() {
        
    }
}
