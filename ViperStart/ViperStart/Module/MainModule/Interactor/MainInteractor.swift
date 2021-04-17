//
//  MainInteractor.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import Foundation


protocol MainInteractorInput {
    
    func mainObtain()
}


final class MainInteractor {
    
    
    private var service: MainServiceProtocol
    private weak var presenter: MainInteractorOutput?
    
    init(service: MainServiceProtocol) {
        self.service = service
    }
}



extension MainInteractor: MainInteractorInput {
    
    func mainObtain() {
        service.obtainMain { [weak self] result in
            
            switch result {
            case .success(let model):
                self?.presenter?.didSuccessToObtainMain(model)
                print(model)
            case .failure(let error):
                print("Ошибка получения данных - модель пуста. Описание ошибки -", error)
            }
        }
    }
}
