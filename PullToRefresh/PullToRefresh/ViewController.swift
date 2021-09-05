//
//  ViewController.swift
//  PullToRefresh
//
//  Created by toaster on 2021/08/10.
//

import UIKit

extension UIViewController {
    
    
}

final class ViewController: UIViewController {
    
    var index = 0
    
    //IBパーツでcellIdentifierを設定した場合と同様のことを行う
    //ReuseQueueとして使うための登録あるいは登録されたセルの利用のための指定
    private let cellIndentifier = "cellIndentifier"
   
    let emojiModel = EmojiModel()
    var emojiData = [String]()
    var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiData = emojiModel.favoriteEmoji
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = .black
        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndentifier)
        view.addSubview(tableView)
        
        tableView.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(didRoadEmoji), for: .valueChanged)
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())",attributes: attributes)
        refreshControl.backgroundColor = .black
        refreshControl.tintColor = .white
    }
    
    @objc func didRoadEmoji(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.emojiData = [self.emojiModel.newFavoriteEmoji,self.emojiModel.favoriteEmoji][self.index]
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            self.index = ( self.index + 1 ) % 2
        }
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier)!
        cell.textLabel?.text = self.emojiData[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = .systemFont(ofSize: 50)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController:UITableViewDelegate{

}

