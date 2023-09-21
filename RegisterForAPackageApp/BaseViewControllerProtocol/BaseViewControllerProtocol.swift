//
//  BaseViewControllerProtocol.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 21/09/2023.
//

import Foundation
import RxSwift

protocol BaseViewControllerProtocol: AnyObject {
    associatedtype ViewModelType: BaseViewModelProtocol
    var viewModel: ViewModelType! { get set }
    
    init(viewModel:ViewModelType)
    func setupViews()
    func bindingViewModels()
    func setupRx()
}


extension BaseViewControllerProtocol where Self: UIViewController {
    static func instantiate<ViewModelType> (withViewModel viewModel: ViewModelType) -> Self where ViewModelType == Self.ViewModelType {
        let viewController = Self.init()
        viewController.viewModel = viewModel
        return viewController
    }
}
