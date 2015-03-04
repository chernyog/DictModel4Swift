//
//  Model.swift
//  DictModel4Swift
//
//  Created by 陈勇 on 15/3/4.
//  Copyright (c) 2015年 zhssit. All rights reserved.
//

import Foundation

class Model: NSObject {
    var str1: String?
    var str2: NSString?
    var b: Bool = true
    var i: Int = 0
    var f: Float = 0
    var d: Double = 0
    var num: NSNumber?
    var info: Info?
    var other: [Info]?
    var others: NSArray?
    var demo: NSArray?
}

class SubModel: Model {
    var boy: String?
}

class ThirdModel: SubModel {
    var address:String?
}

///  Info 类
class Info: NSObject, DebugPrintable{
    var name: String?

    override var debugDescription: String
    {
        let dict = self.dictionaryWithValuesForKeys(["name"])
        return "\(self.name)"
    }
}

extension Model: DictModel4SwiftProtocol, DebugPrintable
{
    static func customClassMapping() -> [String : String]?
    {
        return ["info":"\(Info.self)","other":"\(Info.self)","others":"\(Info.self)","demo":"\(Info.self)"]
    }

    override var debugDescription: String
    {
        let dict = self.dictionaryWithValuesForKeys(["str1","str2","b","i","f","d","num","info","other","others","demo"])
        return "\(dict)"
    }

}