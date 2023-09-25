//
//  SMSMessagesViewController.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 25/09/2023.
//

import UIKit

class SMSMessagesViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var lblRecipientPhoneNumber: UILabel!
    
    @IBOutlet weak var lblNote: UILabel!
    
    @IBOutlet weak var btnConfirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupView()
    }
    
    func setupView() {
        contentView.layer.cornerRadius = 8
        btnConfirm.layer.cornerRadius = 12
        let paragraph = NSMutableParagraphStyle()
        paragraph.minimumLineHeight = 20
        paragraph.alignment = .center
        let attr = NSMutableAttributedString().attrStr(text: "Gửi: ",font: UIFont(name: "Helvetica Neue", size: 12),textColor: .init(hex: "A0AEC0")).attrStr(text: "999",font: UIFont(name: "Helvetica-Bold", size: 14),textColor: .init(hex: "EE2624"))
        let attributedText = NSMutableAttributedString(attributedString: attr)
        attributedText.addAttribute(.paragraphStyle, value: paragraph, range: NSMakeRange(0, attributedText.length))
        lblRecipientPhoneNumber.attributedText = attributedText
        let attr2 = NSMutableAttributedString().attrStr(text: "Chúng tôi sẽ trừ ",font: UIFont(name: "Helvetica", size: 14),textColor: .init(hex: "4A5568")).attrStr(text: "50.000 ",font: UIFont(name: "Helvetica-Bold", size: 14),textColor: .init(hex: "4A5568")).attrStr(text: "từ tài khoản của bạn để đăng ký gói cước ",font: UIFont(name: "Helvetica", size: 14),textColor: .init(hex: "4A5568")).attrStr(text: "CF50",font: UIFont(name: "Helvetica-Bold", size: 14),textColor: .init(hex: "4A5568"))
        let attributedText2 = NSMutableAttributedString(attributedString: attr2)
        attributedText.addAttribute(.paragraphStyle, value: paragraph, range: NSMakeRange(0, attributedText.length))
        lblNote.attributedText = attributedText2
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func precessBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
