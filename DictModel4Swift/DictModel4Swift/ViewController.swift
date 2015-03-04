//
//  ViewController.swift
//  DictModel4Swift
//
//  Created by 陈勇 on 15/3/4.
//  Copyright (c) 2015年 zhssit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static let sharedInstance = ViewController()
    //    override init(){super.init()}
    //
    //    required init(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let json = loadJSON("Model01.json")!

        let obj: AnyObject = DictModel4Swift.sharedInstance.objectWithDictionary(json, cls: Model.self)!
        println(obj.debugDescription)
        let model = obj as! Model
        printLine()
        for a in model.others!
        {
            let info = a as! Info
            println(info)
            printLine()
        }

        // This is a simple language with Swift development of dictionary model framework.
        //        let info = model.others[0] as! Info
        //        println(info.name)

        //        let dictInfo = DictModel4Swift.sharedInstance.fullModelInfo(SubModel.self)
        //        DictModel4Swift.sharedInstance.fullModelInfo(Model.self)
        //        DictModel4Swift.sharedInstance.fullModelInfo(SubModel.self)
        //        println(dictInfo)

    }

    ///  加载JSON
    ///
    ///  :param: fileName JSON文件名
    ///
    ///  :returns: 返回字典
    func loadJSON(fileName: String) -> NSDictionary?
    {
        // 加载json
        let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(fileName, ofType: nil)!)!
        return NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as? NSDictionary
    }
}

