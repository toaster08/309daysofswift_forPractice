//
//  ViewController.swift
//  CustomFont
//
//  Created by 山田　天星 on 2021/06/17.
//

import UIKit

class ViewController: UIViewController {

    static let identifier = "FontCell"
    
    private var data = ["30 Days Swfit","see you next Project"]
    
    private var fontNames = ["MFTongXin_Noncommercial-Regular",
                             "MFJinHei_Noncommercial-Regular",
                             "MFZhiHei_Noncommercial-Regular",
                             "Zapfino",
                             "Gaspar Regular"]
    
    private var fontRowIndex = 0
    
    private var changeFontlabel:UILabel!
    private var changeFontButton:UIButton!
    private var fontTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fontTableView = UITableView()
        fontTableView.backgroundColor = .white
        fontTableView.frame = view.bounds
        view.addSubview(fontTableView)
        
        changeFontButton = UIButton()
        changeFontButton.translatesAutoresizingMaskIntoConstraints = false
        changeFontButton.backgroundColor = .yellow
        changeFontButton.frame = CGRect(x: view.center.x,
                                        y:
                                        width: view.frame.width / 2,
                                        height: 50)
        view.addSubview(changeFontButton)
        
        changeFontlabel = UILabel()
        changeFontlabel.layer.cornerRadius = 50
        changeFontlabel.layer.masksToBounds = true
        changeFontlabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(method))
        changeFontlabel.addGestureRecognizer(gesture)
    }
    
    func changeFontDidTouch(_ sender:AnyObject){
        fontRowIndex = (fontRowIndex + 1) % 5
        print(fontNames[fontRowIndex])
        fontTableView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size: 16)
        return cell
    }
}

