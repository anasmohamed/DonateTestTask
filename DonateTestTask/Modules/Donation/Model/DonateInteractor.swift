//
//  DonateInteractor.swift
//  DonateTestTask
//
//  Created by Anas Mohamed on 5/29/20.
//  Copyright © 2020 Anas Mohamed. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class DonateInteractor {
    func getDonationDetails(
        completionHandler: @escaping (DonateModel?, Error?) -> Void) {
        Alamofire.request(DonateTestTaskRouter.countryName(countryCode: "AE")).responseJSON {(response) in
            
            if let response = response.data {
                print("Response Data: \(response)")
            } else {
                print("Response Data: nil")
            }
            if let request = response.request {
                print("Request Request: \(request)")
                print("Request Description: \(request.description)")
                print("Request Debug Description: \(request.debugDescription)")
                
                print("Response Request HTTP method: \(request.httpMethod!)")
                //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
            } else {
                print("Response Request: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code: \(error.localizedDescription)")
            } else {
                print("Response Error Code: nil")
            }
            
            guard let data = response.data else { return }
            do {
                
                let json = JSON(response.data!)
                print(json)
                let targetAmount = json["ikhair"]["country"].intValue
                let targetAmountString = json["ikhair"]["country"].array
                print("jsonStringAnas \(targetAmountString?.first!["-causes"]["cause"])")
                //let ta = targetAmountString?.first!["-causes"].arrayValue
                // print("jsonStringAnas \(ta?.first!["cause"])")
                let collectedAmount = json["data"]["cancel"].intValue
                let order = DonateModel(targetAmount:targetAmount , collectedAmount:collectedAmount )
                completionHandler(order,nil)
                
                
            }
            
        }
    }
    
}
