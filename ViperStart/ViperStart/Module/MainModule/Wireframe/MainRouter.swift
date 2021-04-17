//
//  MainRouter.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 16.04.2021.
//

import UIKit

protocol MainRouterInput {
    func openMerch()
}

final class MainRouter {
    
    // MARK: - Properties
    
    private unowned let view: UIViewController
    
    
    // MARK: - Init
    
    init(view: UIViewController) {
        self.view = view
    }
}


extension MainRouter: MainRouterInput {
    
    func openMerch() {
        // Вместо нейм создаем нужный нам ВК
        let name = UIViewController()
        view.navigationController?.pushViewController(name, animated: true)
    }
}
