//
//  WFOutCell.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift
class WFOutCell: UITableViewCell {
    
    let label:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.textColor = UIColor.white
        a.backgroundColor = Configuration.instructions.themeColor()
        a.layer.cornerRadius = 5
        a.layer.masksToBounds = true
        return a
    }()
    
    let tap = UITapGestureRecognizer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(label)
        self.contentView.addGestureRecognizer(tap)
        
        label.snp.makeConstraints { (make) in
            
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(10)
            make.bottom.equalTo(0)
            
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        
        if aModel is WFOut{
            
            let h = aModel as! WFOut
            label.text = h.name
            tap.v_tap {
                h.v_to()
            }
        }
    }
    
    
}
class WFOut: VueData{
    
    
    var name:String?
    
    override func v_height() -> CGFloat {
        return 50
    }
    
}



