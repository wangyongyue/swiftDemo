//
//  WFListCell.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/3.
//  Copyright © 2020 test. All rights reserved.
//


import UIKit
import VueSwift
class WFListCell: UITableViewCell {
    
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    lazy private var bigImage:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "v_4")
        return a
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
        self.contentView.addSubview(bigImage)

    
        bigImage.snp.makeConstraints { (make) in
        
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(12)

        }
            
        headerLabel.snp.makeConstraints { (make) in
        
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.bigImage.snp_rightMargin).offset(12)

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
        if aModel is WFList{
            let m = aModel as! WFList
           
            headerLabel.text = m.name
  
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }

        }
    }
    
}
class WFList:VueData{
    
    var name:String?    

}

