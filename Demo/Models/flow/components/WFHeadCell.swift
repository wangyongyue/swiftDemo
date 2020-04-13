//
//  WFHeadCell.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift
class WFHeadCell: UITableViewCell {
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        
        if aModel is WFHead{
            
        }
    }
    
    
}
class WFHead: VueData{
    
        
    override func v_height() -> CGFloat {
        return 150
    }
    
}



