//
//  WFConfiguration.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift

class WFConfiguration: Configuration {
    
    override init() {
        super.init()
       
        Vue.register(aClass: WFMsg.classForCoder(), toClass: WFMsgCell.classForCoder())
        Vue.register(aClass: WFOut.classForCoder(), toClass: WFOutCell.classForCoder())
        Vue.register(aClass: WFHead.classForCoder(), toClass: WFHeadCell.classForCoder())
        Vue.register(aClass: WFPassword.classForCoder(), toClass: WFPasswordCell.classForCoder())
        Vue.register(aClass: WFUsername.classForCoder(), toClass: WFUsernameCell.classForCoder())
        Vue.register(aClass: WFList.classForCoder(), toClass: WFListCell.classForCoder())

        
        Vue.register(aClass: NavTitle.classForCoder(), toClass: NavTitleCell.classForCoder())
        Vue.register(aClass: NavTitle.classForCoder(), toClass: NavTitleCell.classForCoder())

        
        
        
    }
    
    
    
    override func getMainTabBar() -> UIViewController{
           
        let tab = BaseTabBarController()
        
        
        tab.addChildVC(childVC: WFRecords().v_viewController(), childTitle: "单页", image: UIImage.init(named: "v_2"), selectedImage:UIImage.init(named: "v_2"))

        tab.addChildVC(childVC: WFMine().v_viewController(), childTitle: "组件", image: UIImage.init(named: "v_3"), selectedImage:UIImage.init(named: "v_3"))

        return tab
    }
    
    override func themeColor() -> UIColor{
        return UIColor.init(red: 0/255.0, green: 132/255.0, blue: 225/255.0, alpha: 1.0)
    }
    
    override func backgroundColor() -> UIColor{
        return UIColor.white
    }
    override func tabBarBackgroundColor() -> UIColor{
        return UIColor.white
    }
    override func tabBarColor() -> UIColor{
        return UIColor.init(red: 0/255.0, green: 132/255.0, blue: 225/255.0, alpha: 1.0)
    }
    override func navigtaionBackgroundColor() -> UIColor{
        return UIColor.white
    }
    override func navigtaionTextColor() -> UIColor{
        return UIColor.black
    }
    override func statusColor() -> UIColor{
        return UIColor.white
    }
    
    
}
