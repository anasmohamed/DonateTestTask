//
//  DonatePrsenter.swift
//  DonateTestTask
//
//  Created by Anas Mohamed on 5/29/20.
//  Copyright © 2020 Anas Mohamed. All rights reserved.
//

import Foundation
protocol DonateProtocol: NSObjectProtocol {
    func displayOrderData(order: DonateModel)
}

class DonatePresenter {
    let donateInteractor: DonateInteractor
    var donateProtocol: DonateProtocol?
    init(donateProtocol: DonateProtocol) {
           self.donateProtocol = donateProtocol
            donateInteractor = DonateInteractor()
       }
       
     
       
       func orderCountableByStatus() {
           self.donateInteractor.getDonationDetails(completionHandler: {error , order in
               print("sdsdsdsdsdsd-----------",order)
               if order != nil {
                   print("wwwww.....",order)
               }
               else{
                  
               }
               
               
           })
           
       }
}
