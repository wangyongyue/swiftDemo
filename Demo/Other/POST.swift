//
//  POST.swift
//  Demo
//
//  Created by wangyongyue on 2019/7/10.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class POST: NSObject {
    
    func request(params:Conf?,http:POSTProtocol){
        
        if let p = params{
            
            let url = p.getUrl()
            let body = p.getBody()

            Alert.loading()
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                Alert.dissmiss()
                http.POSTHttpWithData(http, "data")
            }
        }
        
    }
    func request(params:Conf?,results:@escaping (Bool,Any) -> ()){
        
        if let p = params{
            let url = p.getUrl()
            let body = p.getBody()
            Alert.loading()
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                
                Alert.dissmiss()
                results(true,"data")
            }
           
        }
        
    }

}

class Debug: NSObject {
    
    static func log<T>(_ message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line)
    {
        #if DEBUG
        let fName = ((fileName as NSString).pathComponents.last!)
        print("\(fName).\(methodName)[\(lineNumber)]: \(message)")
        #else
        #endif
    }
    
    
}
