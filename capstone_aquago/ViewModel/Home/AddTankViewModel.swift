//
//  AddTankViewModel.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/05/16.
//

import Foundation
import RxSwift
import RxCocoa

protocol AddTankDependency {
    var tank: String? { get }
    var fish: String? { get }
}

protocol AddTankInput {
    var tank: PublishRelay<String?> { get }
    var fish: PublishRelay<String?> { get }
    var nextButtonPressed: PublishRelay<Void> { get }
}

protocol AddTankOutput {
    
    var isValid: PublishSubject<Bool> { get }
    var isSaved: PublishSubject<Bool> { get }
}

final class AddTankViewModel: ViewModelType {
    
    var bag = DisposeBag()
    var dependency = Dependency()
    var input = Input()
    var output = Output()
    
    
    //MARK:- ViewModelType
    class Dependency: AddTankDependency {
        var tank: String?
        var fish: String?
    }
    
    struct Input: AddTankInput {
        
        var tank = PublishRelay<String?>()
        var fish = PublishRelay<String?>()
        var nextButtonPressed = PublishRelay<Void>()
        
    }
    
    struct Output: AddTankOutput {
        var isValid = PublishSubject<Bool>()
        var isSaved = PublishSubject<Bool>()
    }
    
    private var isValidInput: Observable<Bool> {
        
        return Observable.combineLatest(input.tank, input.fish) { tank, fish in
            
            let tankIsNotEmpty = !(tank?.isEmpty ?? true)
            let fishIsNotEmpty = !(fish?.isEmpty ?? true)
            
            return tankIsNotEmpty &&
                fishIsNotEmpty
        }
    }
    
    
    //MARK:- Init
    
    init() {
        configureInputListener()
    }
    
    private func configureInputListener() {
        
        Observable.combineLatest(input.tank, input.fish)
            .subscribe(onNext: { [weak self] tank, fish in
                self?.dependency.tank = tank
                self?.dependency.fish = fish
            })
            .disposed(by: bag)
        
        isValidInput
            .subscribe(onNext: { [weak self] isValid in
                self?.output.isValid.onNext(isValid)
            })
            .disposed(by: bag)
        
        input.nextButtonPressed
            .subscribe(onNext: { [weak self] in
                
                var config = [ModelWaterTank]()
                
                let newConfig = ModelWaterTank(tank: self?.dependency.tank ?? "",
                                               fish: self?.dependency.fish ?? "")
                
                if config.contains(newConfig) {
                    self?.output.isSaved.onNext(true)
                    return
                }
                
                config.append(newConfig)
                
                self?.output.isSaved.onNext(true)
            })
            .disposed(by: bag)
    }
}
