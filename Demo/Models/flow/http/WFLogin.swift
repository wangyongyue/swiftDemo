//
//  WFLogin.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift

class WFLogin: Conf{
    var array = [VueData]()
    
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
        m.name = "登录"
        return m
    }
    override func getArray(data:Any) ->Array<VueData>{
        let m1 = WFUsername()
         m1.name = "用户名："
         m1.placeholder = "请输入用户名"
         
         let m2 = WFPassword()
         m2.name = "密码："
         m2.placeholder = "请输入密码"
        
         let out = WFOut()
         out.name = "登录"
         
         self.array.append(WFHead())
         self.array.append(m1)
         self.array.append(m2)
         self.array.append(out)

         return self.array
    }
    override func navigationDidSelect(index:Int){
        
    }
    override func tableDidSelect(index:Int){
        
        if index == 3{
            let user = self.array[1] as! WFUsername
            let password = self.array[2] as! WFPassword

            let h = LoginHttp()
            h.name = user.input
            h.password = password.input
            if let a = user.input,let b = user.input{
                let n = Networking()
                n.request(params: h) { (isS, data) in
                    if isS{
                        if let token = data as? String{
                            LoginHttp.settingTokenAndName(token, a)
                        }
                        UIViewController.toProject()
                    }else{
                        Alert.show(str: data as! String)
                    }
                }
            }else{
                Alert.show(str: "用户名或密码为空")
            }
        }

    }

}
class LoginHttp: Conf{
    var name:String?
    var password:String?
    override func getUrl() -> String{return "/login"}
    override func getRequestType() -> RType{return RType.None}
    override func getBody() -> [String:Any]{
        var body = [String:Any]()
        body["name"] = name
        body["password"] = password
        return body
    }
    
    static func settingTokenAndName(_ token:String, _ name:String){
        
        UserDefaults.standard.set(token, forKey: "token")
        UserDefaults.standard.set(name, forKey: "username")

    }
    
    static func getToken() -> String?{
        
        UserDefaults.standard.string(forKey: "token")

    }
    static func removeToken(){
        
        UserDefaults.standard.removeObject(forKey: "token")

    }
    static func getUsername() -> String?{
        
        UserDefaults.standard.string(forKey: "username")
    }


}
