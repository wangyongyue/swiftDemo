//
//  BaseHttp.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
//let baseUrl = "http://192.168.18.101:8083"
let baseUrl = "http://39.106.180.44:8083"

class WJson{
    
    static func getJson(_ str:String) -> Any?{
        
        let jsonStr = str.replacingOccurrences(of: "\\", with: "")
        let jsonData:Data = jsonStr.data(using: .utf8)!
        let jsonSer = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        
        return jsonSer
    }
    static func stringForDic(_ dic:[String:Any]) -> String{
        
       if (!JSONSerialization.isValidJSONObject(dic)) {
           print("无法解析出JSONString")
           return ""
       }
       let data : NSData! = try? JSONSerialization.data(withJSONObject: dic, options: []) as NSData!
       let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
       return JSONString! as String

    }
    static func getModels(_ json:Any) -> [VueData]{
        var array  = [VueData]()
        if let data = json as? [String:Any]{
            if let datas = data["data"] as? [Any],let dataModels = data["dataModel"] as? [String]{
                for (index,value) in dataModels.enumerated(){
                    if let classType = NSClassFromString(DataStyle.getAppName() + value) as? VueData.Type {
                        let data = classType.init()
                        let dic = datas[index] as! [String:String]
                        data.loadData(dic,true)
                        array.append(data)
                    }
                }
                
            }
        }
       
        return array
    }
        
}
