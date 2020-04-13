//
//  Networking.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import AFNetworking
import VueSwift

class Networking: AFHTTPSessionManager {

    func request(params:Conf?,results:@escaping (Bool,Any) -> ()){
            
            if let p = params{
                
        
                
                let url = baseUrl + p.getUrl()
                let body = p.getBody()
                Alert.loading()

                self.responseSerializer.acceptableContentTypes?.insert("text/html")
                self.responseSerializer.acceptableContentTypes?.insert("application/json")
                self.responseSerializer.acceptableContentTypes?.insert("text/html")

                self.requestSerializer.timeoutInterval = 5

                self.post(url, parameters: body, progress: nil, success: { (task, data) in
                    Alert.dissmiss()
                    if let a = data as? NSDictionary{
                        print(a)
                        if  let b = a["code"] as? Int{
                            if b == 1000{
                                results(true,a["data"])
                            }else{
                                
                                results(false,a["message"])

                            }

                        }
                    }
                }) { (task, error) in
                    Alert.dissmiss()
                    print(error)
                    results(false,"网络加载失败")
                }
               
            }
        }
   
}
