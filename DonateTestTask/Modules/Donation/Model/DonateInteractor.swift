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
                
                let json = JSON(data)
                let countries = json["ikhair"]["country"].array
                let cause = countries?.first!["-causes"]["cause"]
                let targetAmount = cause?.array?.first!["-targetAmount"].intValue
                let collectedAmount = cause?.array?.first!["-collectedAmount"].intValue
                let dontaionDetails = DonateModel(targetAmount:targetAmount , collectedAmount:collectedAmount )
                completionHandler(dontaionDetails,nil)
                
                
            }
            
        }
    }
    
}
