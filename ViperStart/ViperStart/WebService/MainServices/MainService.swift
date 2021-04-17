//
//  MainService.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//


import Foundation

protocol MainServiceProtocol {
    func obtainMain(completion: @escaping (Result<MainModel>) -> Void)
}


final class MainServiceImp: MainServiceProtocol {
    
    
    // MARK: - Properties
    
    private let networkLayer: NetworkLayer
    
    
    // MARK: - Init
    
    init(networkLayer: NetworkLayer) {
        self.networkLayer = networkLayer
    }
    
    
    // MARK: - HomeService
    
    func obtainMain(completion: @escaping (Result<MainModel>) -> Void) {
        networkLayer.request(HomeEndpoint.home, completion: completion)
        
        print(networkLayer.request(HomeEndpoint.home, completion: completion), "request ----")
        
    }
        
//{ (result: Result<HomdeData>) in
            
//  switch result {
//
//     case .success(let response):
//         completion(.success(model: response.self))
//
//     case .failure(let error):
//          completion(.failure(error: error))
//  }
// }
//}
}
