//
//  RegisterViewController.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 21/09/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var txtPhoneNumber: CustomTextField!
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var btnNextBottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtPhoneNumber.delegate = self
        setupView()
        setupKeyboard()
    }
    func setupView() {
        btnNext.layer.cornerRadius = 12
        btnNext.isUserInteractionEnabled = false
        btnNext.backgroundColor = .init(hex: "EDF2F7")
        btnNext.titleLabel?.textColor = .init(hex: "A0AEC0")
        btnNext.titleLabel?.tintColor = .init(hex: "FFFFFF")
        
    }
    
    func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        txtPhoneNumber.keyboardType = .numberPad
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                btnNextBottomConstraint.constant = keyboardSize.height
            } 
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        btnNextBottomConstraint.constant = 20
    }
    
    @IBAction func processNextAction(_ sender: Any) {
        let vc = RegisterPackageViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func processLoginVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if txtPhoneNumber.text?.count ?? 0 == 10 {
            
            btnNext.isUserInteractionEnabled = true
            btnNext.backgroundColor = .init(hex: "4364F7")
            btnNext.titleLabel?.textColor = .init(hex: "FFFFFF")
        } else {
            btnNext.isUserInteractionEnabled = false
            btnNext.backgroundColor = .init(hex: "EDF2F7")
            btnNext.titleLabel?.textColor = .init(hex: "A0AEC0")
            btnNext.titleLabel?.tintColor = .init(hex: "FFFFFF")
            
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == txtPhoneNumber {
            var is_check : Bool
            let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            is_check = string == numberFiltered
            if is_check {
                let minLength = 9
                let maxLength = 10
                let currentString: NSString = textField.text! as NSString
                let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
                if textField.text?.first != "0" {
                    is_check = newString.length <= minLength
                } else {
                    is_check = newString.length <= maxLength
                }
            }
            return is_check
        } else {
            return true
        }

    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if txtPhoneNumber.text?.count ?? 0 == 10 {
            
            btnNext.isUserInteractionEnabled = true
            btnNext.backgroundColor = .init(hex: "4364F7")
            btnNext.titleLabel?.textColor = .init(hex: "FFFFFF")
        } else {
            btnNext.isUserInteractionEnabled = false
            btnNext.backgroundColor = .init(hex: "EDF2F7")
            btnNext.titleLabel?.textColor = .init(hex: "A0AEC0")
            btnNext.titleLabel?.tintColor = .init(hex: "FFFFFF")
            
        }
    }
    
}
