//
//  ViewController.swift
//  DonateTestTask
//
//  Created by Anas Mohamed on 5/28/20.
//  Copyright © 2020 Anas Mohamed. All rights reserved.
//

import UIKit
import UICircularProgressRing
class DonateViewController: UIViewController ,DonateProtocol{
    @IBOutlet weak var collectedMoneyLabel: UILabel!
    @IBOutlet weak var targetMoneyLabel: UILabel!
    
    @IBOutlet weak var donateBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var amountFinishRatioCircle: UICircularProgressRing!
    
    func displayOrderData(order: DonateModel) {
        print("order : \(order.targetAmount)")
    }
    
    var presenter : DonatePresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DonatePresenter(donateProtocol: self)
        presenter?.orderCountableByStatus()
        amountFinishRatioCircle.maxValue = 100
        amountFinishRatioCircle.startProgress(to: 49, duration: 2.0) {
        print("Done animating!")
        // Do anything your heart desires...
      }
        facebookBtn.circularButton()
        facebookBtn.setImage(UIImage(named:"facebook_icon"), for: .normal)
        // Do any additional setup after loading the view.
    }

    @IBAction func facebookBtnDidTapped(_ sender: Any) {
    }
    
    @IBAction func twitterBtnDidTapped(_ sender: Any) {
    }
    
    @IBAction func shareBtnDidTapped(_ sender: Any) {
    }
    
    
    @IBAction func donateBtnDidTapped(_ sender: Any) {
    }
    
}

