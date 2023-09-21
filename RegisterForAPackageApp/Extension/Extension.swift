//
//  Extension.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 20/09/2023.
//

import Foundation
import UIKit


@IBDesignable extension UIButton {
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
extension UIViewController{
    func setBackButton() {
        let button = UIButton(frame: CGRect.init(x: -2, y: 0, width: 24, height: 24))
        button.setImage(UIImage(named: "back_icon"), for: .normal)
        button.setTitle(nil, for: .normal)
        button.addTarget(self, action:  #selector(goBack), for: .touchUpInside)
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 24, height: 24)))
        view.clipsToBounds = false
        view.addSubview(button)
        let item = UIBarButtonItem.init(customView: view)
        self.navigationItem.leftBarButtonItem = item
    }
    @objc func goBack() {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            self.navigationController?.popViewController(animated: true)
        } else if self.presentingViewController != nil{
            self.dismiss(animated: true, completion: nil)
        } else if ((self.navigationController?.presentingViewController) != nil){
            self.navigationController?.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: false)
        }
    }
}
extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
extension UITableView {
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.reuseIdentifier) as? T
    }
}
