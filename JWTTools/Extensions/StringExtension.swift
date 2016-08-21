//
//  StringExtension.swift
//  JWTTools
//
//  Created by Andoni Dan on 21/08/16.
//  Copyright © 2016 carpemeid. All rights reserved.
//

import Foundation

extension String
{
    var hexData : NSData
    {
        return NSData.bytesFromHexString(self)
    }
}