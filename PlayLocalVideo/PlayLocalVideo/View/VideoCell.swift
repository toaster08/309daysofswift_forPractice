//
//  VideoCell.swift
//  PlayLocalVideo
//
//  Created by toaster on 2021/06/24.
//

import UIKit

protocol playMovieDelegate: class{
    func playMovie() -> Void
}

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    
    weak var delegate: playMovieDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        print("Storyboardまたはnibファイルからロードされた直後に呼ばれる")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
//        print("選択状態と通常状態の状態アニメーション処理")
    }
    
    @IBAction func playMovieButton(_ sender:Any) {
        print("delegateに渡します")
        self.delegate?.playMovie()
        print("delegateを実行しました")
    }
}

