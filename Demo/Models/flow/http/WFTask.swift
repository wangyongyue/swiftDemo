//
//  Task.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift

class WFTask: HttpProtocol ,EventProtocol,V_ViewControllerProtocol{
    
    var datas = [TaskModel]()
    var url: String = "/getModules"
    func getPOSTBody() -> [String:Any]{
         var body = [String:Any]()
         body["token"] = LoginHttp.getToken()
         return body
     }
    func v_viewController() -> UIViewController {
     
        let vc = WFTableViewController()
        vc.m = self
        vc.http = self
        return vc
    }

    func getNvgition(data:Any) -> VueData {
         
         let m = NavTitle()
         m.name = "模块"
         return m
                    
     }
     
    func getArray(data:Any) ->Array<VueData>{
        var array = [VueData]()
        datas = TaskModel.getModelForAny(data)
        for value in datas{
            let a = WFList()
            a.name = value.name
            array.append(a)
        }
        
        return array
     
    }
    func navigationDidSelect(index:Int){
         
         print(index)
     }
    func tableDidSelect(index:Int){
         print(index)
        if let str = datas[index].module{
            let page = PageRecords.getPages(str)
            let m = WFRecordDetails()
            m.page = page
            Router.push(m, nil, nil)
        }
        

     }

}
class TaskModel{
    
    var id:Int?
    var name:String?
    var module:String?
    
    static func getModelForAny(_ data:Any) -> [TaskModel]{
    
        var list = [TaskModel]()
        if let array = data as? [Any]{
            for value in array{
                if let dic = value as? [String:Any]{
                    var m = TaskModel()
                    m.id = dic["id"] as? Int
                    m.name = dic["name"] as? String
                    m.module = dic["module"] as? String
                    list.append(m)
                }
            }
        }
        
        return list
        
    }
}
class PageRecords {
    
    var id:Int?
    var subPage:PageRecords?
    
    static func getPages(_ module:String) -> PageRecords{
        
        let  page = PageRecords()

        if let json = WFJson.getJson(module){
            if let array = json as? [Any]{
                for (index,value) in array.enumerated(){
                    if let dic = value as? [String:Any]{
                        if index == 0{
                            page.id = dic["id"] as? Int
                        }else{
                            if let a = page.subPage{
                                a.id = dic["id"] as? Int
                                
                            }else{
                                let subPage = PageRecords()
                                subPage.id = dic["id"] as? Int
                                page.subPage = subPage
                            }
                        }
                        
                    }
                }
            }
        }
        
        return page
    }
    
}
