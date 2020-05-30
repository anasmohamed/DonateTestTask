//
//  SocialMediaSharingManager .swift
//  DonateTestTask
//
//  Created by Anas Mohamed on 5/30/20.
//  Copyright © 2020 Anas Mohamed. All rights reserved.
//

import Foundation
import Social
import UIKit
public protocol SocialMediaShareable {
    
    func text() -> String?
}
public class SocialMediaSharingManager {
    public static func shareOnFacebook(object: SocialMediaShareable, from presentingVC: UIViewController) {
        share(object: object, for: SLServiceTypeFacebook, from: presentingVC)
    }
    public static func shareOnTwitter(object: SocialMediaShareable, from presentingVC: UIViewController) {
        share(object: object, for: SLServiceTypeTwitter, from: presentingVC)
    }
    private static func share(object: SocialMediaShareable, for serviceType: String, from presentingVC: UIViewController) {
        if let composeVC = SLComposeViewController(forServiceType:serviceType) {
          
            composeVC.setInitialText(object.text())
            presentingVC.present(composeVC, animated: true, completion: nil)
        }
    }
}
