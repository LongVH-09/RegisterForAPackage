//
//  CustomTextField.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 21/09/2023.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: UIEdgeInsets.init(top: 0, left: 52, bottom: 0, right: 52))
        }
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: UIEdgeInsets.init(top: 0, left: 52, bottom: 0, right: 52))
        }
}
