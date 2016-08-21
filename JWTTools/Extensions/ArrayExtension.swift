//
//  ArrayExtension.swift
//  JWTTools
//
//  Created by Andoni Dan on 21/08/16.
//  Copyright © 2016 carpemeid. All rights reserved.
//

import Foundation

extension Array
{
    var berData : NSData
    {
        return (self as? NSArray)?.berData() ?? NSData()
    }
}