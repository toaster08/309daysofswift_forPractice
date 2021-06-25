//
//  VideoModel.swift
//  PlayLocalVideo
//
//  Created by toaster on 2021/06/24.
//

import Foundation

struct Video {
    let image: String
    let title: String
    let source: String
}

class VideoModel{
    
    var data = [
        
        Video(image: "videoScreenshot01",
              title: "Introduce #DS Mario",
              source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02",
              title: "Emoji Among Us",
              source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03",
              title: "Seals Documentary",
              source: "Vine - 00:06"),
        Video(image: "videoScreenshot04",
              title: "Adventure Time",
              source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05",
              title: "Facebook HQ",
              source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06",
              title: "Lijiang Lugu Lake",
              source: "Allen - 20:30")
        
    ]
}
