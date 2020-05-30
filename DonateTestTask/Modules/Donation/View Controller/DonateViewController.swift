//
//  ViewController.swift
//  DonateTestTask
//
//  Created by Anas Mohamed on 5/28/20.
//  Copyright © 2020 Anas Mohamed. All rights reserved.
//

import UIKit
import UICircularProgressRing
import Social

class DonateViewController: UIViewController ,DonateProtocol{
    @IBOutlet weak var collectedMoneyLabel: UILabel!
    @IBOutlet weak var targetMoneyLabel: UILabel!
    
    @IBOutlet weak var donateBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var amountFinishRatioCircle: UICircularProgressRing!
    
    func displayOrderData(order: DonateModel) {
        collectedMoneyLabel.text = String(order.collectedAmount!)
        targetMoneyLabel.text = String(order.targetAmount!)
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
        // Do any additional setup after loading the view.
    }

    @IBAction func facebookBtnDidTapped(_ sender: Any) {
      //  SocialMediaSharingManager.shareOnFacebook(object: , from: self)
    }
    
    @IBAction func twitterBtnDidTapped(_ sender: Any) {
    }
    
    @IBAction func shareBtnDidTapped(_ sender: Any) {
        let URLstring = String(format:"https://itunes.apple.com/in/app/facebook/id284882215?mt=8")
        let urlToShare = URL(string:URLstring)
        let title = "title to be shared"
        let activityViewController = UIActivityViewController(
            activityItems: [title,urlToShare!],
            applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        //so that ipads won't crash
        present(activityViewController,animated: true,completion: nil)
    }
    
    
    @IBAction func donateBtnDidTapped(_ sender: Any) {
       let sms: String = "sms:+5115"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)

    }
    
}

