//
//  view.swift
//  CustomFont
//
//  Created by toaster on 2021/06/19.
//

import Foundation
import UIKit

final class View:UIViewController {
    
    private var changeFontlabel:UILabel!
    var fontTableView:UITableView!
    
    override func viewDidLoad() {
        setupView()
    }
    
    func setupView() {
//        fontTableView = UITableView()
        fontTableView = UITableView()
        fontTableView.backgroundColor = .black
        fontTableView.frame = view.bounds
        view.addSubview(fontTableView)
        
//        changeFontlabel = UILabel()
        changeFontlabel = UILabel()
        changeFontlabel.layer.cornerRadius = view.frame.width / 3 / 2
        changeFontlabel.layer.masksToBounds = true
        changeFontlabel.isUserInteractionEnabled = true
        changeFontlabel.text = "change"
        changeFontlabel.textAlignment = .center
        changeFontlabel.textColor = .black
        changeFontlabel.backgroundColor = .yellow
        changeFontlabel.frame = CGRect(x: view.center.x - (view.frame.width / 3)/2,
                                        y: view.frame.size.height - view.frame.width / 3 - 60,
                                        width: view.frame.width / 3,
                                        height: view.frame.width / 3)
    }
    
}
