//
//  BaseViewModel.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 21/09/2023.
//

import Foundation
import RxSwift

//MARK: - BaseViewModelProtocol
protocol BaseViewModelProtocol: AnyObject {
    
    associatedtype Input
    associatedtype Output
    
    func transfrom(from input: Input) -> Output
}

//MARK: - BaseViewModel
class BaseViewModel:NSObject{
    var disposeBag = DisposeBag()
    
}
