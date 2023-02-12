//
//  BookDetailVC.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/12/23.
//

import UIKit

class BookDetailVC: UIViewController {

    var data: BookModel!
    
    var mainView: BookDetailView {
        return view as! BookDetailView
    }

    override func loadView() {
        super.loadView()
        view = BookDetailView()
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        data.isLiked = AccountUserDefaults.liked.contains(data.id)
        mainView.setupData(data: data)
        
        setupCallbacks()
    }
    
    func setupCallbacks(){
        mainView.closeClickCallback = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        mainView.favoriteClickCallback = { [weak self] in
            guard let self = self else { return }
            if self.data.isLiked == true {
                AccountUserDefaults.liked = AccountUserDefaults.liked.filter( {$0 != (self.data.id) } )
                self.data.isLiked = false
            } else {
                AccountUserDefaults.liked.append(self.data.id)
                self.data.isLiked = true
            }
            
            self.mainView.setupData(data: self.data)
        }
        
        mainView.playClickCallback = { [weak self] in
            guard let id = self?.data.id else { return }
            AudioPlayer.shared.reset()
            
            let vc = FullScreenPlayerVC()
            AudioPlayerVC.shared.currentSongIndex = AudioPlayerVC.shared.data.firstIndex(where: {$0.id == id }) ?? 0
            self?.present(vc, animated: true)
        }
        
        mainView.closeClickCallback = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}
