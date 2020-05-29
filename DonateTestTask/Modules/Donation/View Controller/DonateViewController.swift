//
//  ViewController.swift
//  DonateTestTask
//
//  Created by Anas Mohamed on 5/28/20.
//  Copyright © 2020 Anas Mohamed. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController ,DonateProtocol{
    
    
    func displayOrderData(order: DonateModel) {
        print("order : \(order.targetAmount)")
    }
    
    var presenter : DonatePresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DonatePresenter(donateProtocol: self)
        presenter?.orderCountableByStatus()
        // Do any additional setup after loading the view.
    }


}

