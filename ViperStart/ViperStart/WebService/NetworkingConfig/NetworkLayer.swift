//
//  NetworkLayer.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import Foundation
import Alamofire

enum Result<Model> {
    case success(model: Model)
    case failure(error: Error)
}

protocol NetworkLayer {
    func request<T: Decodable>(_ endpoint: EndpointProtocol, completion: @escaping (Result<T>) -> Void)
    func request(_ endpoint: EndpointProtocol, completion: @escaping (Result<Data>) -> Void)
}

final class NetworkLayerImp: NetworkLayer {
    
    // MARK: - Properties
    
    private let sessionManager: Session
    
    
    // MARK: - Init
    
    init() {
        let session = Session()
        self.sessionManager = session
    }
    
    // MARK: - NetworkLayer
    
    func request(_ endpoint: EndpointProtocol, completion: @escaping (Result<Data>) -> Void) {
        
        let request = sessionManager.request(endpoint: endpoint)
        
        request?.debugLog().responseData(completionHandler: { response in
            
            switch response.result {
            
            case .success(let data):
                
                let statusCode = response.response!.statusCode
                switch statusCode {
                case 200...399:
                    completion(.success(model: data))
                case 400...599:
                    completion(.failure(error: NSError.serverError(statusCode)))
                default:
                    completion(.failure(error: NSError.unknownError()))
                }
                
                if statusCode > 299 {
                    
                    guard let url = response.response?.url?.absoluteString else { return }
                    guard let data = response.data, let responseBody = String(data: data, encoding: .utf8) else { return }
                    
                    let range = NSRange(location: 0, length: url.utf16.count)
                    guard let rExp = try? NSRegularExpression(pattern: "\\/api.*\\/(.*?)\\?") else { return }
                    guard let match = rExp.firstMatch(in: url, options: [], range: range) else { return }
                    guard let apiRange = Range(match.range(at: 1), in: url) else  { return }
                    
                    let decodedResponse = NSMutableString(string: responseBody)
                    CFStringTransform(decodedResponse, nil, "Any-Hex/Java" as NSString, true)
                    
                    _ = NSError(domain: String(url[apiRange]), code: statusCode, userInfo: [
                        "url" : url,
                        "response_body": decodedResponse
                    ])
                }
                
            case .failure(let error):
                
                let error = error as NSError
                switch error.code {
                case 3840:
                    completion(.failure(error: NSError.unknownServer()))
                case NSURLErrorTimedOut:
                    request?.cancel()
                    completion(.failure(error: NSError.timeoutError()))
                case NSURLErrorNotConnectedToInternet:
                    completion(.failure(error: NSError.notConnectedToInternet()))
                case NSURLErrorCancelled: break
                default:
                    completion(.failure(error: error))
                    break
                }
            
            }
            
        })
    }
    
    func request<T>(_ endpoint: EndpointProtocol, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        
        request(endpoint) { result in
            
            switch result {
            
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model: result))
                } catch {
                    completion(.failure(error: NSError.incorrectServerResponse()))
                }
                
            case .failure(let error):
                completion(.failure(error: error))
            }
        }
    }
}

