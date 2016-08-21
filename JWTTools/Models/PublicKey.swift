//
//  PublicKey.swift
//  JWTTools
//
//  Created by Andoni Dan on 21/08/16.
//  Copyright © 2016 carpemeid. All rights reserved.
//

import Foundation

private let kKeyPreamble : String = "-----BEGIN CERTIFICATE REQUEST-----"
private let kKeyPostamble : String = "-----END CERTIFICATE REQUEST-----"

public class PublicKey : NSObject
{
    let exponent : String
    let modulus : String
    
    public var pemString : String
    {
        let base64String : String = [modulus.hexData, exponent.hexData].berData.base64EncodedStringWithOptions([])
        
        print("\(kKeyPreamble)\n\(base64String)\n\(kKeyPostamble)")
        
        return "\(kKeyPreamble)\n\(base64String)\n\(kKeyPostamble)"
    }
    
    public init(exponentString : String, modulusString : String) {
        
        self.exponent = exponentString
        self.modulus = modulusString
        
        super.init()
    }
    
    
}