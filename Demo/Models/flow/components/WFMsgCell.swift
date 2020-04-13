//
//  WFMsg.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
class WFMsgCell: UITableViewCell {
    
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    let line:UIView = {
           let a = UIView()
           a.backgroundColor = UIColor.lightGray
           return a
       }()
    
    
    let tap = UITapGestureRecognizer()
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(line)
        self.contentView.addGestureRecognizer(self.tap)
        self.contentView.addSubview(headerLabel)

        
        headerLabel.snp.makeConstraints { (make) in
        
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(12)
            make.right.equalTo(-50)

        }
        line.snp.makeConstraints { (make) in
            make.bottom.equalTo(-0.5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)

        }
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is WFMsg{
            let m = aModel as! WFMsg
           
            headerLabel.text = m.name
  
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }

        }
    }
    
}
class WFMsg:VueData{
    
    var name:String?
    

}

