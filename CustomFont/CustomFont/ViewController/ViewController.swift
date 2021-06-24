//
//  ViewController.swift
//  CustomFont
//
//  Created by 山田　天星 on 2021/06/17.
//

import UIKit

final class ViewController: UIViewController {

    private var fontRowIndex = 0
    private var changeFontlabel:UILabel!
    private var changeFontButton:UIButton!
    private var fontTableView:UITableView!
    private var fontModel:Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fontModel = CustomFont.Model()
        
        fontTableView = UITableView()
        fontTableView.backgroundColor = .black
        fontTableView.frame = view.bounds
        view.addSubview(fontTableView)
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        fontTableView.register(cellNib, forCellReuseIdentifier: fontModel.identifier)
        
        fontTableView.delegate = self
        fontTableView.dataSource = self
    
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
        view.addSubview(changeFontlabel)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeFont(_:)))
        changeFontlabel.addGestureRecognizer(gesture)
    }
    
    @objc func changeFont(_ sender:AnyObject){
        fontRowIndex = Int.random(in: 0...4)
        print(fontModel.fontNames[fontRowIndex])
        fontTableView.reloadData()
    }
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: fontModel.identifier, for: indexPath) as! TableViewCell
        let text = fontModel.data[indexPath.row] 
        cell.setCall(text: text,font:fontModel.fontNames[fontRowIndex],size:20)
        
        return cell
    }
}

//protocol  changeFontDelegate {
//    func changeFont()
//}

