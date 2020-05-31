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
    
    func displayDonationDetails(donateModel: DonateModel) {
        collectedMoneyLabel.text = String(donateModel.collectedAmount!)
        targetMoneyLabel.text = String(donateModel.targetAmount!)
        amountFinishRatioCircle.maxValue = 100
       
        let ratio = Float( Float(donateModel.collectedAmount!) / Float(donateModel.targetAmount!)) * 100
        let floatRatio = CGFloat(ratio)
        amountFinishRatioCircle.startProgress(to: floatRatio , duration: 2.0) {
        }
    }
    
    var presenter : DonatePresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DonatePresenter(donateProtocol: self)
        presenter?.getDonationDetails()
        
        donateBtn.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
    }
    
    @IBAction func facebookBtnDidTapped(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            self.present(fbShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func twitterBtnDidTapped(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            
            let tweetShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            self.present(tweetShare, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to tweet.", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func shareBtnDidTapped(_ sender: Any) {
        let text = "This is some text that I want to share."
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func donateBtnDidTapped(_ sender: Any) {
        let sms: String = "sms:5115"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
        
    }
    
}

