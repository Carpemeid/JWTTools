//
//  ResourcesDeposit.swift
//  JWTTools
//
//  Created by Andoni Dan on 21/08/16.
//  Copyright © 2016 carpemeid. All rights reserved.
//

import Foundation

private let kPlistExtension : String = "plist"
private let kPublicKeysFileName : String = "publicKeys"

private let kKeyToken : String = "idToken"
private let kKeyPublicKeys : String = "publicKeys"

public class ResourcesDeposit : NSObject
{
    public class var tokenPublicKey : [NSObject : AnyObject]
    {
        
        guard let publicKeysArray : [[NSObject : AnyObject]] = tokenDataDictionary[kKeyPublicKeys] as? [[NSObject : AnyObject]] else
        {
            return [:]
        }
        
        return  publicKeysArray.first ?? [:]
    }
    
    public class var token : String
    {
        guard let token = tokenDataDictionary[kKeyToken] as? String else
        {
            return ""
        }
        
        return token
    }
    
    class var tokenDataDictionary : [NSObject : AnyObject]
    {
        return dictionaryWithName(kPublicKeysFileName)
    }
    
    class var bundle : NSBundle
    {
        return NSBundle(forClass: ResourcesDeposit.classForCoder())
    }
    
    class func dictionaryWithName(name : String) -> [NSObject : AnyObject]
    {
        guard let url = bundle.URLForResource(name, withExtension: kPlistExtension) else
        {
            return [:]
        }
        
        guard let dictionary = NSDictionary(contentsOfURL: url) as? [NSObject : AnyObject] else
        {
            return [:]
        }
        
        return dictionary
    }
}