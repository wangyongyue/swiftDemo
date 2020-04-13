//
//  WFMine.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift

class WFMine: Conf{
   
    override func getUrl() -> String{return ""}
    override func getRequestType() -> RType{return RType.None}
    override func getBody() -> [String:Any]{return  [String:Any]()}
    override func v_viewController() -> UIViewController{
        let vc = WFTableViewController()
        vc.m = self
        return vc
    }
    override func getNvgition(data:Any) -> VueData{
        let m = NavTitle()
        m.name = "组件"
        return m
    }
    
    override func getArray(data:Any) ->Array<VueData>{
        var array = [VueData]()
        let m1 = WFMsg()
        if let name = LoginHttp.getUsername(){
            m1.name = "用户名称：" + name
        }
        let m2 = WFMsg()
               m2.name = "公司：暂无"
        let m3 = WFMsg()
               m3.name = "职位：暂无"
        let m4 = WFOut()
               m4.name = "退出登录"
        array.append(m1)
        array.append(m2)
        array.append(m3)
        array.append(WFHead())
        array.append(m4)
        return array
    }
    override func navigationDidSelect(index:Int){}
    override func tableDidSelect(index:Int){
        if index == 4{
            LoginHttp.removeToken()
            UIViewController.toLogin()
        }
    }
   
}
