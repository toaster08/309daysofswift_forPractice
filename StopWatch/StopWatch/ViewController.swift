//
//  ViewController.swift
//  StopWatch
//
//  Created by toaster on 2021/06/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var playButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!
    @IBOutlet private weak var timerLabel: UILabel!
    
    private var counter:Float = 0.0 {
        didSet {
            //didsetで値がsetされた際に処理される内容
            //counterをformatの形式でString型に変換してtextに代入
            timerLabel.text = String(format:"%.1f", counter)
        }
    }
    
    //timerのインスタンスを生成
    //変数の型そのものはTimerのオプショナル
    //これによってnilを許容できるようになる
    private var timer:Timer? = Timer()
    
    //
    private var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        counter = 0.0
        
    }

    
    @IBAction private func resetButtonDidTapped(_ sender: UIButton) {
        //timerのインスタンスが生成されている場合にはif letで定数
        if let timer = timer {
            timer.invalidate()
        }
        timer = nil
        isPlaying = false
        counter = 0
        playButton.isEnabled = true
        stopButton.isEnabled = true
        
    }
    
    @IBAction private func playButtonDidTapped(_ sender: UIButton) {
        playButton.isEnabled = false
        stopButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func stopButtonDidTapped(_ sender: UIButton) {
        playButton.isEnabled = true
        stopButton.isEnabled = false
        if let timer = timer{
            timer.invalidate()
        }
        timer = nil
        isPlaying = false
    }
    
    
    @objc private func updateTimer(){
        counter = counter + 0.1
    }
    
    
    
    
    

}

