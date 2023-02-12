//
//  AudioPlayerVC.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/12/23.
//

import UIKit

class AudioPlayerVC: UIViewController {

    static let shared = AudioPlayerVC()
    
    var musicPlayer = AudioPlayer.shared
    var data: [BookModel] = []
    
    var currentSongIndex: Int = 0 {
        didSet {
            self.musicPlayer.stop()
            self.updateSong()
            self.configureUI()
        }
    }
    
    var currentSongItem: BookModel {
        return self.data[self.currentSongIndex]
    }
    
    var playButton: UIButton!
    var nextBtn: UIButton!
    var previousBtn: UIButton!
    var songImageView: UIImageView!
    var songName: UILabel!
    var songAuthor: UILabel!
    
    var startTimeLabel: UILabel?
    var endTimeLabel: UILabel?
    var progressBar: UISlider?
    
    func configureUI() {
        songImageView.image = UIImage(named: currentSongItem.imageName)
        songName.text = currentSongItem.title
        songAuthor.text = currentSongItem.author
        startTimeLabel?.text = "00:00"
        endTimeLabel?.text = "00:00"
    }

    func updateSong() {
        switch self.musicPlayer.state {
        case .playing:
            self.musicPlayer.pause()
        case .paused:
            self.musicPlayer.play()
        case .stopped:
            self.playButton?.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            let url = Bundle.main.url(forResource: self.currentSongItem.filename, withExtension: "mp3")!
            self.musicPlayer.set(songURL: url, andPlayImmediatly: true)
        }
    }
    
      func handleDidEnd() {
        self.playButton?.setImage(UIImage(systemName: "play.circle"), for: .normal)
        self.playNextSong(didEnd: true)
    }
    
      func playNextSong(didEnd: Bool) {
        self.playButton?.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        let nextIndex = self.currentSongIndex + 1
        if nextIndex < self.data.endIndex {
            self.currentSongIndex = nextIndex
        } else if didEnd {
           self.playButton?.setImage(UIImage(systemName: "play.circle"), for: .normal)
        }
    }
    
      func handlePlayButtonImage() {
        let image = self.musicPlayer.state == .playing ? UIImage(systemName: "play.circle") : UIImage(systemName: "pause.circle")
        self.playButton?.setImage(image, for: .normal)
    }
    
    func previousSong() {
      self.playButton?.setImage(UIImage(systemName: "pause.circle"), for: .normal)
      let previousIndex = self.currentSongIndex - 1
      self.currentSongIndex = previousIndex >= self.data.startIndex ? previousIndex : self.currentSongIndex
    }
    
    func nextSong() {
        self.playNextSong(didEnd: false)
    }
  
  
    func playSong() {
        self.handlePlayButtonImage()
        self.updateSong()
    }
  
    func stopSong() {
        self.playButton?.setImage(UIImage(systemName: "play.circle"), for: .normal)
        self.musicPlayer.stop()
    }
}
