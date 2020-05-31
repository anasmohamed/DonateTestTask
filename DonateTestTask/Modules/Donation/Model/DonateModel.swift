//
//  DonateModel.swift
//  DonateTestTask
//
//  Created by Anas Mohamed on 5/29/20.
//  Copyright © 2020 Anas Mohamed. All rights reserved.
//

import Foundation
struct DonateModel : Codable {
    let targetAmount : Int?
    let collectedAmount : Int?
    
        
    
    var order: (Int, Int){
        return (targetAmount: targetAmount!,
                collectedAmount: collectedAmount!
               )
    }
    enum CodingKeys: String, CodingKey {
        
        case targetAmount = "targetAmount"
        case collectedAmount = "collectedAmount"
        
    }
}
