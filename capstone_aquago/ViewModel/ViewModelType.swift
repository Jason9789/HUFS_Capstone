//
//  ViewModelType.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/05/16.
//

import Foundation
import RxSwift

protocol ViewModelType {
    
    associatedtype Dependency
    associatedtype Input
    associatedtype Output
    
    var bag: DisposeBag { get }
    
    var dependency: Dependency { get }
    
    var input: Input { get }
    
    var output: Output { get }
    
}
