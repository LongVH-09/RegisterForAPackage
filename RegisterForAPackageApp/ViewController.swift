//
//  ViewController.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 20/09/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientView: UIView!
    
    @IBOutlet weak var txtPhoneNumber: CustomTextField!
    
    @IBOutlet weak var txtPassword: CustomTextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    let gradient = GradientView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }

    func setupView() {
        btnLogin.layer.cornerRadius = 12
        txtPhoneNumber.layer.cornerRadius = 12
        txtPassword.layer.cornerRadius = 12
    }
    
    func setGradientView() {
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    @IBAction func btnLoginAction(_ sender: Any) {
        
    }
    
    @IBAction func processRegister(_ sender: Any) {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

