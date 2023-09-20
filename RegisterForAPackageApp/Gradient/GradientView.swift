//
//  GradientColor.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 20/09/2023.
//

import Foundation
import UIKit

class GradientView : UIView {
    
    private let gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        let colorTop = UIColor(hex: "A6F1F7")?.cgColor
        let colorBottom = UIColor(hex: "#2375F1")?.cgColor
        gradient.colors = [colorTop!,colorBottom!]
        gradient.colors = [colorTop!, colorBottom!]
        gradient.locations = [3]
        return gradient
    }()
    
    init() {
        super.init(frame: .zero)
        gradient.frame = frame
        layer.insertSublayer(gradient, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds

        }
    
}
