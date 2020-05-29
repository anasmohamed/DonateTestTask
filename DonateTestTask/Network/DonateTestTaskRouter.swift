//
//  DonateTestTaskRouter.swift
//  DonateTestTask
//
//  Created by Anas Mohamed on 5/28/20.
//  Copyright © 2020 Anas Mohamed. All rights reserved.
//

import Foundation
import Alamofire

enum DonateTestTaskRouter: URLRequestConvertible {
    
    
    case countryName(countryCode:String)
    
//
//    var path: String {
//        switch self {
//        case .countryName:
//            return NetworkingConstants.country
//        }
//    }
    var httpMethod: HTTPMethod {
        switch self {
        case .countryName:
            return .get
        }
    }
    
    var httpHeaders: HTTPHeaders {
        
        var httpHeaders = [String:String]()
        
        switch self {
        case .countryName:
            httpHeaders[NetworkingConstants.accept] = NetworkingConstants.contentTypeJSON
         
        }
        
        return httpHeaders
    }
    
    var body: [String: Any] {
        
        let body = [String:Any]()
        
        switch self {
            
            
        default:
            print("Empty request body")
        }
        
        return body
    }
    
    var params: [String: Any] {
        
        var params = [String:Any]()
        
        switch self {
        case let .countryName(countryCode):
            params[NetworkingConstants.country] = countryCode
            
            
            
        default:
            print("Empty Paramter")
            
        }
        
        return params
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = try NetworkingConstants.baseURL.asURL()
        
        // URL Request Components
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = httpHeaders
        switch self {
        case .countryName:
            
            return try URLEncoding.methodDependent.encode(urlRequest, with: params)
            
            //        case .register, .addBarber, .addService:
            //            return try JSONEncoding.default.encode(urlRequest, with: body)
            
        }
    }
}
