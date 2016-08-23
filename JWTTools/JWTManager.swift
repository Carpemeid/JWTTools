//
//  JWTManager.swift
//  JWTTools
//
//  Created by Andoni Dan on 21/08/16.
//  Copyright © 2016 carpemeid. All rights reserved.
//

import Foundation
import SwiftyRSA

public class JWTManager : NSObject
{
    let decoder : JWTDecoder
    
    public init(JWTTokenString : String) {
        
        decoder = JWTDecoder(tokenString: JWTTokenString)

        super.init()
    }
    
    public func verifyWithPublicKey(publicKey : PublicKey, digestMethod : SwiftyRSA.DigestType = SwiftyRSA.DigestType.SHA256) throws -> Bool
    {
        return try SwiftyRSA.verifySignatureString(decoder.dataComponent ?? "", signature: decoder.signature ?? "", publicKeyPEM: publicKey.pemString, digestMethod: digestMethod).boolValue
    }
}