//
//  CustomButton.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 21/09/2023.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    override var isEnabled:Bool {
            didSet {
                if isEnabled == false {
                    self.setTitleColor(.lightGray, for: .normal)
                    self.isUserInteractionEnabled = false
                } else {
                    self.setTitleColor(.blue, for: .normal)
                    self.isUserInteractionEnabled = true
                }
                
            }
        }
}
