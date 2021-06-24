//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by toaster on 2021/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView:UITableView!
    var model:VideoModel!
    let identifier = "VideoCell"


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView = UITableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        let cellNib = UINib(nibName: "VideoCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model = VideoModel()
    }
}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let mainImage = UIImage(named:model.data[indexPath.row].image)
//        let height:CGFloat = mainImage?.size.height ??

        return 220
    }

    func numberOfSections(in tableView: UITableView) -> Int {
    return 2
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! VideoCell
        cell.videoScreenshot.image = UIImage(named:model.data[indexPath.row].image)
        cell.videoTitleLabel.text =  model.data[indexPath.row].title
        cell.videoSourceLabel.text = model.data[indexPath.row].source
        
        return cell
    }
}

