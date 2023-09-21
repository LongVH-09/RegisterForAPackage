//
//  Validators.swift
//  RegisterForAPackageApp
//
//  Created by Long Vo on 21/09/2023.
//

import Foundation

class Validators {
    
   static func validatePhoneNumber(value: String) -> Bool {

        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
       return result
    }
    
}
