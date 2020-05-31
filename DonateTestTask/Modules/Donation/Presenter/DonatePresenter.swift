//
//  DonatePrsenter.swift
//  DonateTestTask
//
//  Created by Anas Mohamed on 5/29/20.
//  Copyright © 2020 Anas Mohamed. All rights reserved.
//

import Foundation
protocol DonateProtocol: NSObjectProtocol {
    func displayDonationDetails(donateModel: DonateModel)
}

class DonatePresenter {
    let donateInteractor: DonateInteractor
    var donateProtocol: DonateProtocol?
    init(donateProtocol: DonateProtocol) {
           self.donateProtocol = donateProtocol
            donateInteractor = DonateInteractor()
       }
    
       func getDonationDetails() {
           self.donateInteractor.getDonationDetails(completionHandler: {donate , error in
               if donate != nil {
                self.donateProtocol?.displayDonationDetails(donateModel: donate!)
               }
               
           })
           
       }
}
