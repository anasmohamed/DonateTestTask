//
//  CircularButton.swift
//  DonateTestTask
//
//  Created by Anas Mohamed on 5/30/20.
//  Copyright © 2020 Anas Mohamed. All rights reserved.
//

import Foundation
import UIKit

extension  UIButton{
    func circularButton(){
        self.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.clipsToBounds = true
        
    }
}
