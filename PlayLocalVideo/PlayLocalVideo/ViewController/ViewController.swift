//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by toaster on 2021/06/24.
//

import UIKit
import AVKit
import AVFoundation

 class ViewController: UIViewController {
    
    private var tableView:UITableView!
    var model:VideoModel!
    let identifier = "VideoCell"
    
    var videoCell:VideoCell? = nil
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        videoCell = VideoCell()
        videoCell?.delegate = self
        
        tableView = UITableView()
        tableView.frame = view.bounds
        tableView.delaysContentTouches = false
        view.addSubview(tableView)
        
        let cellNib = UINib(nibName: "VideoCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model = VideoModel()
    }
}

extension ViewController: playMovieDelegate {
    
    func play() {
        print("delegate確認中")
//        if let path = Bundle.main.path(forResource: "emoji_zone", ofType: "mp4") {
//            playerView = AVPlayer(url: URL(fileURLWithPath: path))
//            playViewController.player = playerView
//            present(playViewController,animated: true) {
//                self.playViewController.player?.play()
//            }
//        } else {
//            print("cannot play")
//        }
    }
}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let mainImage = UIImage(named:model.data[indexPath.row].image)
//        let height:CGFloat = mainImage?.size.height ??

        return 220
    }

    func numberOfSections(in tableView: UITableView) -> Int {
    return 3
    }
    
//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
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


