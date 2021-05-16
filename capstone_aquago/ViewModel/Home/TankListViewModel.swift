//
//  TankListViewModel.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/05/16.
//

import Foundation
import RxSwift
import RxCocoa

protocol TankListDependency {
    var listConfigs: [ModelWaterTank] { get }
}

protocol TankListInput {
    var selectedConfig: BehaviorRelay<ModelWaterTank?> { get }
}

final class TankListViewModel: ViewModelType {
    
    var bag = DisposeBag()
    var dependency = Dependency()
    var input = Input()
    var output = Output()
    
    class Dependency: TankListDependency {
        
        var listConfigs = [ModelWaterTank]()
        
    }
    
    struct Input: TankListInput {
        
        var selectedConfig = BehaviorRelay<ModelWaterTank?>(value: nil)
        
    }
    
    struct Output {
        
    }
}
