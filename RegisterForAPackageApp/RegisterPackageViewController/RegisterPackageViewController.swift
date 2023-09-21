//
//  RegisterPackageViewController.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 21/09/2023.
//

import UIKit
import RxSwift

class RegisterPackageViewController: UIViewController {

    @IBOutlet weak var registerTableView: UITableView!
    
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Đăng ký gói cước"
        registerTableView.delegate = self
        registerTableView.dataSource = self
        registerTableView.registerCell(type: RegisterPackageTableViewCell.self)
        setupView()
        self.setBackButton()
    }
    
    func setupView() {
        let button = UIButton(frame: CGRect.init(x: -14, y: 0, width: 30, height: 30))
        button.setImage(UIImage(named: "search_icon"), for: .normal)
        button.setTitle(nil, for: .normal)
        button.addTarget(self, action:  #selector(openPopup), for: .touchUpInside)
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 30, height: 30)))
        view.clipsToBounds = false
        view.addSubview(button)
        let item = UIBarButtonItem.init(customView: view)
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc func openPopup() {
        if popupView.tag == 0 {
            popupView.tag = 1
            popupView.isHidden = false
        } else if popupView.tag == 1 {
            popupView.tag = 0
            popupView.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
extension RegisterPackageViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 236
    }
}
extension RegisterPackageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = registerTableView.dequeueCell(withType: RegisterPackageTableViewCell.self) as! RegisterPackageTableViewCell
        
        return cell
    }
    
    
}
