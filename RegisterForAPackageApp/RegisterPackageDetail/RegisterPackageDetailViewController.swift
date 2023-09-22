//
//  RegisterPackageDetailViewController.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 22/09/2023.
//

import UIKit

class RegisterPackageDetailViewController: UIViewController {

    @IBOutlet weak var gradientView: UIView!
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var lblNote: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setBackButton()
        setupView()
        
    }
    func setupView() {
        btnNext.layer.cornerRadius = 12
        let paragraph = NSMutableParagraphStyle()
        paragraph.minimumLineHeight = 20
        paragraph.alignment = .center
        let attr = NSMutableAttributedString().attrStr(text: "Chúng tôi sẽ thanh toán",font: UIFont(name: "Plus Jakarta Sans", size: 12)).attrStr(text: " 399.000 vnđ",font: UIFont(name: "NunitoSans-Bold", size: 14)).attrStr(text: " từ tài khoản của bạn để đăng ký gói cước",font: UIFont(name: "Plus Jakarta Sans", size: 12)).attrStr(text: " MFY399",font: UIFont(name: "Plus Jakarta Sans", size: 14))
        let attributedText = NSMutableAttributedString(attributedString: attr)
        attributedText.addAttribute(.paragraphStyle, value: paragraph, range: NSMakeRange(0, attributedText.length))
        lblNote.attributedText = attributedText
    }

}
