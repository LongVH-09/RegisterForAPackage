//
//  RegisterPackageViewController.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 21/09/2023.
//

import UIKit

class RegisterPackageViewController: UIViewController {

    @IBOutlet weak var registerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Đăng ký gói cước"
        setupView()
        self.setBackButton()
    }
    
    func setupView() {
        let button = UIButton(frame: CGRect.init(x: -14, y: 0, width: 24, height: 24))
        button.setImage(UIImage(named: "search_icon"), for: .normal)
        button.setTitle(nil, for: .normal)
        button.addTarget(self, action:  #selector(openPopup), for: .touchUpInside)
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 24, height: 24)))
        view.clipsToBounds = false
        view.addSubview(button)
        let item = UIBarButtonItem.init(customView: view)
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc func openPopup() {
        print("..")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
