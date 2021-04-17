//
//  MainPresenter.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 16.04.2021.
//

import Foundation

protocol MainViewOutput: ViewOutput {
    func viewIsReady()
}

protocol MainInteractorOutput: AnyObject {
    func didSuccessToObtainMain(_ mainModel: MainModel)
}


final class MainPresenter {
    
    // MARK: - Properties
    
    private unowned var view: MainViewInput
    private let interactor: MainInteractorInput
    private let dataConverter: MainDataConverterInput
    private var mainModel: MainModel
    private let router: MainRouterInput?
    
    
    // MARK: - Init
    
    init(view: MainViewInput, interactor: MainInteractorInput, dataConverter: MainDataConverterInput, mainModel: MainModel, router: MainRouterInput) {
        self.view = view
        self.interactor = interactor
        self.dataConverter = dataConverter
        self.mainModel = mainModel
        self.router = router
    }
    
}



extension MainPresenter: MainViewOutput {
    
    func viewIsReady() {
        interactor.mainObtain()
    }
}

extension MainPresenter: MainInteractorOutput {
    
    func didSuccessToObtainMain(_ mainModel: MainModel) {
        self.mainModel = mainModel
        let viewModel = dataConverter.convert(main: self.mainModel)
        view.update(with: viewModel)
    }
}
