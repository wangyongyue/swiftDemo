//
//  WFTableViewController.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift

class WFTableViewController: UIViewController {

    var m:Conf?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Configuration.instructions.backgroundColor()
        
        let style = UIView()
        style.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20)
        style.alpha = 1
        self.view.addSubview(style)
        style.backgroundColor = Configuration.instructions.statusColor()
        
    
        let navigation = CTable()
        self.view.addSubview(navigation)
        navigation.isScrollEnabled = false
        navigation.backgroundColor = Configuration.instructions.navigtaionBackgroundColor()
        navigation.snp.makeConstraints { (make) in
            
            make.top.equalTo(Adapter.topStatus())
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(Adapter.topNavigation())
        }
       
      
        let table = CTable()
        self.view.addSubview(table)
        table.backgroundColor = Configuration.instructions.backgroundColor()
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(TOP)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        
        if let type =  self.m?.getRequestType() {
            if type == RType.None {
                
                table.array = self.m?.getArray(data:"nil")
                table.reloadData()
                
            }else{
                
                let n = Networking()
                n.request(params: self.m) { (isS, data) in
                    
                    if isS{
                        if let n = self.m?.getNvgition(data:data){
                            navigation.array = [n]
                            navigation.reloadData()
                        }
                        
                        table.array = self.m?.getArray(data:data)
                        table.reloadData()
                    }
                    
                }
                
            }
        }
       

        table.v_didSelect { (index) in
            
            self.m?.tableDidSelect(index: index)
            
        }
        navigation.v_didSelect { (index) in
            
            self.m?.navigationDidSelect(index: index)
        }

        
    }
    

}
