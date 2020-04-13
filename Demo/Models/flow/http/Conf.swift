//
//  Conf.swift
//  Demo
//
//  Created by wangyongyue on 2020/4/13.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift

enum RType {
    case None
    case POST
    case GET
}
class Conf {
    
    func getUrl() -> String{return ""}
    func getRequestType() -> RType{return RType.POST}
    func getBody() -> [String:Any]{return  [String:Any]()}
    func v_viewController() -> UIViewController{return UIViewController()}
    func getNvgition(data:Any) -> VueData{return VueData()}
    func getArray(data:Any) ->Array<VueData>{return [VueData]()}
    func navigationDidSelect(index:Int){}
    func tableDidSelect(index:Int){}
    
}
