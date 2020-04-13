//
//  NavTitleCell.swift
//  Demo
//
//  Created by wangyongyue on 2020/2/25.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import VueSwift
class NavTitleCell: UITableViewCell {
    
  
    lazy private var deleteButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "file_delete"), for: .normal)
        a.backgroundColor = UIColor.clear
        return a
    }()
    
    lazy private var headerLabel1:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.numberOfLines = 1
        return a
    }()
        
    
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = bgColor
        return a
    }()
   
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.contentView.addSubview(self.headerLabel1)

       
      
        self.headerLabel1.numberOfLines = 2
        self.headerLabel1.snp.makeConstraints { (make) in
            
            make.left.equalTo(20)
            make.top.equalTo(12)
            make.right.equalTo(-20)

        }
       
        self.contentView.addSubview(self.line)

        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0.5)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(0)
            
        }
        self.contentView.addGestureRecognizer(tap)
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is NavTitle{
            
            let m = aModel as! NavTitle
            
            if let a = m.name{
                headerLabel1.text = a
            }else{
                headerLabel1.text = "数据数据数据数据"
            }
         
        }
    }
}
class NavTitle:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return 49
    }
}
