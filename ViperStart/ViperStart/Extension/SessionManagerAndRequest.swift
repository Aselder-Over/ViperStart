//
//  SessionManagerAndRequest.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import Foundation
import Alamofire

extension Alamofire.Request {
    
    public func debugLog() -> Self {
        
        #if DEBUG
        debugPrint("=======================================")
        debugPrint(self)
        debugPrint("=======================================")
        #endif
        
        return self
    }
}

extension Session {
    
    func request(endpoint: EndpointProtocol) -> DataRequest? {
        
        guard let baseUrl = endpoint.baseUrl else {
            return nil
        }
        
        return request(baseUrl.appendingPathComponent(endpoint.path),
                       method: endpoint.method,
                       parameters: endpoint.parameters,
                       encoding: endpoint.encoding,
                       headers: endpoint.headers)
    }
}
