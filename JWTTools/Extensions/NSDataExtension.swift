//
//  NSDataExtension.swift
//  JWTTools
//
//  Created by Andoni Dan on 21/08/16.
//  Copyright © 2016 carpemeid. All rights reserved.
//

import Foundation

extension NSData
{
    class func bytesFromHexString(hexString : String) -> NSData
    {
        var clearedString : String = hexString.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).joinWithSeparator("")
        
        let data : NSMutableData = NSMutableData()
        
        while clearedString.characters.count > 0 {
            
            let advancedIndex : String.CharacterView.Index = clearedString.startIndex.advancedBy(2)
            
            let subString : String = clearedString.substringToIndex(advancedIndex)
            clearedString = clearedString.substringFromIndex(advancedIndex)
            
            var character : UInt32 = 0
            NSScanner(string: subString).scanHexInt(&character)
            
            data.appendBytes(&character, length: 1)
        }
        
        return data
    }
}