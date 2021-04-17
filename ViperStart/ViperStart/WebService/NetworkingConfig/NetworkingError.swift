//
//  NSError.swift
//  Hoff
//
//  Created by Alexander Shmakov on 30.11.16.
//  Copyright © 2016 WeLike. All rights reserved.
//

import Foundation

enum HPErrorCode: Int {
    case incorrectServerResponse = 65101
    case unknownError = 65000
    case unknownServer = 3840
}

extension NSError {
    
    class func incorrectServerResponse(_ domain: String? = nil) -> NSError {
        let userInfo = [
            NSLocalizedDescriptionKey : Errors.incorrectServerResponse
        ]
        return NSError(
            domain: domain ?? "WebService",
            code: HPErrorCode.incorrectServerResponse.rawValue,
            userInfo: userInfo)
    }
    
    class func clientError(_ code: Int) -> NSError {
        let userInfo = [
            NSLocalizedDescriptionKey : Errors.clientError
        ]
        return NSError(domain: "WebService", code: code, userInfo: userInfo)
    }
    
    class func serverError(_ code: Int) -> NSError {
        let userInfo = [
            NSLocalizedDescriptionKey : Errors.serverError
        ]
        return NSError(domain: "WebService", code: code, userInfo: userInfo)
    }
    
    class func serverErrorWithStatus(_ status: [String: AnyObject]) -> NSError {
        let userInfo = [
            NSLocalizedDescriptionKey : status["message"] as? String ?? Errors.unknownError
        ]
        let code = status["code"] as? Int ?? 0
        return NSError(domain: "WebService", code: code, userInfo: userInfo)
    }
    
    class func customError(_ code: Int, description: String) -> NSError {
        let userInfo = [
            NSLocalizedDescriptionKey : description
        ]
        return NSError(domain: "WebService", code: code, userInfo: userInfo)
    }
    
    class func timeoutError() -> NSError {
        let userInfo = [
            NSLocalizedDescriptionKey : Errors.timeOut
        ]
        return NSError(
            domain: "WebService",
            code: NSURLErrorTimedOut,
            userInfo: userInfo
        )
    }
    
    class func unknownError() -> NSError {
        let userInfo = [
            NSLocalizedDescriptionKey : Errors.unknownError
        ]
        return NSError(
            domain: "WebService",
            code: HPErrorCode.unknownError.rawValue,
            userInfo: userInfo
        )
    }
    
    class func unknownServer() -> NSError {
        let userInfo = [
            NSLocalizedDescriptionKey : Errors.unknownServer
        ]
        return NSError(
            domain: "WebService",
            code: HPErrorCode.unknownServer.rawValue,
            userInfo: userInfo
        )
    }
    
    class func notConnectedToInternet() -> NSError {
        let userInfo = [
            NSLocalizedDescriptionKey : Errors.noConnection
        ]
        return NSError(
            domain: "WebService",
            code: NSURLErrorNotConnectedToInternet,
            userInfo: userInfo
        )
    }
    
}

