//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by toaster on 2021/06/24.
//

import UIKit
import AVKit
import AVFoundation

final class ViewController: UIViewController {
    
    private var tableView:UITableView!
    private var model:VideoModel!
    private let identifier = "VideoCell"
    
    var videoCell:VideoCell!
    let playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! VideoCell
        cell.delegate = self
        cell.videoScreenshot.image = UIImage(named:model.data[indexPath.row].image)
        cell.videoTitleLabel.text =  model.data[indexPath.row].title
        cell.videoSourceLabel.text = model.data[indexPath.row].source
        
        return cell
    }
}

extension ViewController:playMovieDelegate {
    func playMovie() {
        print("delegateできた")
        let path = Bundle.main.path(forResource: "emoji_zone", ofType: "mp4")
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewController.player = playerView
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
}

