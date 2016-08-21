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
        let dataSignature : NSData? = (decoder.signature ?? "").dataUsingEncoding(NSUTF8StringEncoding)
        
        let base64Signature : String? = dataSignature?.base64EncodedStringWithOptions([])
        
        return try SwiftyRSA.verifySignatureString(decoder.correctedDataComponent ?? "", signature: base64Signature ?? "", publicKeyPEM: publicKey.pemString, digestMethod: digestMethod).boolValue
    }
}