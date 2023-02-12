//
//  FullScreenPlayerVC.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/12/23.
//

import UIKit

class FullScreenPlayerVC: UIViewController {
    
    var player = AudioPlayerVC.shared
    var progress: AudioPlayer.Progress?
    
    var mainView: FullScreenPlayerView {
        return view as! FullScreenPlayerView
    }
    
    override func loadView() {
        super.loadView()
        view = FullScreenPlayerView()
        view.backgroundColor = .white
        
        player.playButton = mainView.playBtn
        player.nextBtn = mainView.nextBtn
        player.previousBtn = mainView.prevBtn
        player.songImageView = mainView.img
        player.songName = mainView.title
        player.songAuthor = mainView.author
        player.startTimeLabel = mainView.elapsedTime
        player.endTimeLabel = mainView.remainingTime
        player.progressBar = mainView.slider
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallbacks()
        
        player.configureUI()
        player.playButton?.setImage(UIImage.init(systemName: "pause.circle"), for: .normal)
        
        player.musicPlayer.observer = { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .didBegin:
                self.player.progressBar?.value = 0.0
                
            case .didEnd:
                self.player.handleDidEnd()
                
            case .progress(let progress):
                if progress.duration.isNaN { return }
                if progress.percentCompleted.isNaN { return }
                self.progress = progress
                self.player.endTimeLabel?.text = self.timeFormatted(Int(progress.duration))
                self.player.startTimeLabel?.text = self.timeFormatted(Int(progress.currentTime))
                self.player.progressBar?.value = (Float(progress.percentCompleted))
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Tabbar.shared.bottomPlayer.initObserver()
    }

    func setupCallbacks(){
        mainView.nextClickCallback = { [weak self] in
            self?.player.nextSong()
        }
        
        mainView.prevClickCallback = { [weak self] in
            self?.player.previousSong()
        }
        
        mainView.playClickCallback = { [weak self] in
            self?.player.playSong()
        }

        mainView.sliderChangedCallback = { [weak self] in
            guard let progress = self?.progress else { return }
            let value = Double((self?.mainView.slider.value)!) * progress.duration
            if value.isNaN || value.isInfinite {
                self?.mainView.slider.value = 0
            } else {
                self?.player.musicPlayer.seekTo(seconds: value)
            }
        }

    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = (totalSeconds / 60 / 60) % 24
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
