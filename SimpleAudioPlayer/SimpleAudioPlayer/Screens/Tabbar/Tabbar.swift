//
//  Tabbar.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/11/23.
//

import UIKit
import SnapKit

class Tabbar: UITabBarController {
    
    static let shared = Tabbar()
    
    let bottomPlayer = BottomPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupBottomPlayer()
        setupVC()
    }
    
    func setupBottomPlayer(){
        AudioPlayerVC.shared.data = SongData.shared.data
        bottomPlayer.player.configureUI()
        bottomPlayer.player.playButton?.setImage(UIImage.init(systemName: "play.circle"), for: .normal)

//        bottomPlayer.player.updateSong()
//        bottomPlayer.player.stopSong()
        
        view.addSubview(bottomPlayer)
        bottomPlayer.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(tabBar.snp.top)
            make.height.equalTo(80)
        }
    }
    
    
    func setupVC(){
        let main = TableVC(type: .main)
        main.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        
        let search = TableVC(type: .search)
        search.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)

        let favorites = TableVC(type: .liked)
        favorites.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)

        viewControllers = [main, search, favorites]
    }
}
