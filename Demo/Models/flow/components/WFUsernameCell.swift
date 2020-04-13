//
//  WFUsernameCell.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/2.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
class WFUsernameCell: UITableViewCell {
    
    let label:UILabel = {
        let a = UILabel()
        return a
    }()
    let textField:UITextField = {
        let field = UITextField()
        field.textColor = UIColor.black
        field.borderStyle = .none
        return field
    }()
    
    let tap = UITapGestureRecognizer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(label)
        self.contentView.addGestureRecognizer(tap)
        self.contentView.addSubview(textField)

        label.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(60)
            make.width.equalTo(80)
            make.bottom.equalTo(0)
            
        }
        
        textField.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(140)
            make.right.equalTo(-20)
            make.bottom.equalTo(0)
            
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        
        if aModel is WFUsername{
            
            let h = aModel as! WFUsername
            label.text = h.name
            textField.placeholder = h.placeholder
            textField.v_change {
                
                h.input = self.textField.text
            }
            tap.v_tap {
                
                h.v_to()
            }
        }
    }
    
    
}
class WFUsername: VueData{
    
    
    var name:String?
    var placeholder:String?
    var input:String?

    override func v_height() -> CGFloat {
        return 50
    }
    
}



