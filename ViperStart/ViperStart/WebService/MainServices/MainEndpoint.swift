//
//  MainEndpoint.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import Alamofire

enum HomeEndpoint: EndpointProtocol {
    
    case home
    
    var path: String {
        
        switch self {
        
        case .home:
            return "/Home.json"
        }
    }
    
    var method: HTTPMethod {
        
        switch self {
        
        case .home:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .home:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding()
    }
    
}
