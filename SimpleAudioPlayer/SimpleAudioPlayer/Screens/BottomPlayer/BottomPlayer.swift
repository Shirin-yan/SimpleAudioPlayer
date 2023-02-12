//
//  BottomPlayer.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/12/23.
//

import UIKit

class BottomPlayer: UIView {

    var player = AudioPlayerVC.shared

    let contentStack: UIStackView = {
        let s = UIStackView()
        s.alignment = .center
        s.axis = .horizontal
        s.spacing = 10
        s.isLayoutMarginsRelativeArrangement = true
        s.layoutMargins.right = 10
        return s
    }()
    
    var img = UIImageView()

    let titleStack: UIStackView = {
        let s = UIStackView()
        s.alignment = .fill
        s.axis = .vertical
        s.spacing = 2
        return s
    }()
    
    var title: UILabel = {
        let t = UILabel()
        t.textColor = .label
        t.numberOfLines = 1
        t.textAlignment = .left
        return t
    }()
    
    var author: UILabel = {
        let t = UILabel()
        t.textColor = .secondaryLabel
        t.numberOfLines = 1
        t.textAlignment = .left
        return t
    }()

    var playBtn: UIButton = {
        let btn = UIButton()
        btn.imageView?.snp.makeConstraints { make in
            make.size.equalTo(30)
        }
        return btn
    }()
    
    var nextBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "forward.end.circle"), for: .normal)
        btn.imageView?.snp.makeConstraints { make in
            make.size.equalTo(30)
        }
        return btn
    }()

    var prevBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "backward.end.circle"), for: .normal)
        btn.imageView?.snp.makeConstraints { make in
            make.size.equalTo(30)
        }
        return btn
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        playBtn.addTarget(self, action: #selector(playClick), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(nextClick), for: .touchUpInside)
        prevBtn.addTarget(self, action: #selector(prevClick), for: .touchUpInside)

        addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }

        img.snp.makeConstraints { make in
            make.size.equalTo(80)
        }
        
        contentStack.addArrangedSubview(img)
        contentStack.addArrangedSubview(titleStack)
        contentStack.addArrangedSubview(UIView())
        contentStack.addArrangedSubview(prevBtn)
        contentStack.addArrangedSubview(playBtn)
        contentStack.addArrangedSubview(nextBtn)
                
        titleStack.addArrangedSubview(title)
        titleStack.addArrangedSubview(author)
        
        initObserver()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initObserver(){
        set()
        player.musicPlayer.observer = { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .didBegin:
                self.player.progressBar?.value = 0.0
                
            case .didEnd:
                self.player.handleDidEnd()
                
            case .progress(_):
                return
            }
        }
    }
    
    func set(){
        player.playButton = playBtn
        player.nextBtn = nextBtn
        player.previousBtn = prevBtn
        player.songImageView = img
        player.songName = title
        player.songAuthor = author
    }
    
    @objc func playClick(){
        player.playSong()
    }
    
    @objc func nextClick(){
        player.nextSong()
    }

    @objc func prevClick(){
        player.previousSong()
    }
}
