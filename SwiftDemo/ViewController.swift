//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Andoni Dan on 21/08/16.
//  Copyright © 2016 carpemeid. All rights reserved.
//

import UIKit
import JWTTools
import Resources

private let kKeyExponent : String = "e"
private let kKeyModulus : String = "n"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let exponentString : String = ResourcesDeposit.tokenPublicKey[kKeyExponent] as? String ?? ""
        let modulusString : String = ResourcesDeposit.tokenPublicKey[kKeyModulus] as? String ?? ""
        
        let key : PublicKey = PublicKey(exponentString: exponentString, modulusString: modulusString)
        
        let manager : JWTManager = JWTManager(JWTTokenString: ResourcesDeposit.token)
        
        do
        {
            print("the key is valid has the value \(try manager.verifyWithPublicKey(key))")
        }
        catch
        {
            print("error : \(error)")
        }
    }
    
    
}

