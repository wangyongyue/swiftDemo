//
//  Records.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
class WFRecords: Conf{
    
    private var datas = [RecordModel]()
    override func getUrl() -> String{return "/getPages"}
    override func getRequestType() -> RType{return RType.POST}
    override func getBody() -> [String:Any]{
        var body = [String:Any]()
        body["token"] = LoginHttp.getToken()
        return body
    }
    
    override func v_viewController() -> UIViewController{
        let vc = WFTableViewController()
        vc.m = self
        return vc
    }
    override func getNvgition(data:Any) -> VueData{
        let m = NavTitle()
        m.name = "单页"
        return m
    }
    override func getArray(data:Any) ->Array<VueData>{
        
        var array = [VueData]()
        datas = RecordModel.getModelForAny(data)
        for value in datas{
            let a = WFList()
            a.name = value.name
            array.append(a)
        }
        return array
    }
    override func navigationDidSelect(index:Int){}
    override func tableDidSelect(index:Int){
        
    }
   
}
class RecordModel{
    
    var id:Int?
    var name:String?
    var page:String?
    
    static func getModelForAny(_ data:Any) -> [RecordModel]{
    
        var list = [RecordModel]()
        if let array = data as? [Any]{
            for value in array{
                if let dic = value as? [String:Any]{
                    var m = RecordModel()
                    m.id = dic["id"] as? Int
                    m.name = dic["name"] as? String
                    m.page = dic["page"] as? String
                    list.append(m)
                }
            }
        }
        
        return list
        
    }
}
