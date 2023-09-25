//
//  RegistrationConfirmationViewController.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 25/09/2023.
//

import UIKit

class RegistrationConfirmationViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
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
        let attr = NSMutableAttributedString().attrStr(text: "Đăng ký cho thuê bao: ",font: UIFont(name: "Helvetica", size: 12),textColor: .init(hex: "4A5568")).attrStr(text: "0987 654 321",font: UIFont(name: "Helvetica-Bold", size: 14),textColor: .init(hex: "4A5568"))
        let attributedText = NSMutableAttributedString(attributedString: attr)
        attributedText.addAttribute(.paragraphStyle, value: paragraph, range: NSMakeRange(0, attributedText.length))
        lblNote.attributedText = attributedText
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func processBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func processConfirm(_ sender: Any) {
        let vc = SMSMessagesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
