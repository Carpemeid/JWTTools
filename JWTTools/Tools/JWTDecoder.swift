//
//  JWTDecoder.swift
//  JWTTools
//
//  Created by Andoni Dan on 21/08/16.
//  Copyright © 2016 carpemeid. All rights reserved.
//

import Foundation

private let kHeaderComponentIndex : Int = 0
private let kDataComponentIndex : Int = 1
private let kSignatureComponentIndex : Int = 2

///Decodes the java web token
@objc public class JWTDecoder : NSObject
{
    let tokenString : String
    
    public init(tokenString : String) {
        self.tokenString = tokenString
    }
    
    public var decodedDictionary : [NSObject : AnyObject]?
    {
        guard let decodedValue = decodedValue else {return nil}
        
        do
        {
            return try NSJSONSerialization.JSONObjectWithData(decodedValue, options: NSJSONReadingOptions.AllowFragments) as? [NSObject : AnyObject]
        }
        catch
        {
            return nil
        }
    }
    
    var decodedValue : NSData?
    {
        return NSData(base64EncodedString: dataComponent?.convertFromBase64URLToBase64() ?? "", options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
    }
    
    var message : String?
    {
        guard let header = header else
        {
            return nil
        }
        
        guard let dataComponent = dataComponent else
        {
            return nil
        }
        
        return header + "." + dataComponent
    }
    
    var header : String?
    {
        return componentAtIndex(kHeaderComponentIndex)
    }
    
    var dataComponent : String?
    {
        return componentAtIndex(kDataComponentIndex)
    }
    
    var signature : String?
    {
        return componentAtIndex(kSignatureComponentIndex)?.convertFromBase64URLToBase64()
    }
    
    func componentAtIndex(index : Int) -> String?
    {
        let tokenComponents : [String] = tokenString.componentsSeparatedByString(".")
        
        if tokenComponents.count > index
        {
            return tokenComponents[index]
        }
        
        return nil
    }
}