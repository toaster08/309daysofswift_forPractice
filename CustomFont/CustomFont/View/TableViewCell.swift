//
//  TableViewCell.swift
//  CustomFont
//
//  Created by toaster on 2021/06/19.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func prepareForReuse() {
      super.prepareForReuse()
        self.textLabel?.textColor = UIColor.white
        self.backgroundColor = .black
    }
    
    func setCall(text:String,font:String,size:Int){
        titleLabel?.text = text
        titleLabel?.font = UIFont(name:font, size: CGFloat(size))
        self.titleLabel?.textColor = .white
        self.backgroundColor = .black
    }
}
