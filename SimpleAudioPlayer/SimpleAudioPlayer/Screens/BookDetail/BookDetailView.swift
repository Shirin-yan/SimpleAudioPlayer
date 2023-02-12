//
//  BookDetailView.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/12/23.
//

import UIKit
import SnapKit

class BookDetailView: UIView {

    let scrollView = UIScrollView()
    
    let contentStack: UIStackView = {
        let s = UIStackView()
        s.alignment = .fill
        s.axis = .vertical
        s.spacing = 10
        return s
    }()

    var img = UIImageView()
    
    var favoriteBtn = UIButton(configuration: .filled())
    
    var closeBtn = UIButton()
    
    var playBtn = UIButton(configuration: .filled())

    var title = UILabel()
    
    var author = UILabel()

    var desc = UILabel()

    var playClickCallback: ( ()->() )?
    
    var favoriteClickCallback: ( ()->() )?
    
    var closeClickCallback: ( ()->() )?

    override init(frame: CGRect) {
        super.init(frame: frame)
        playBtn.addTarget(self, action: #selector(playClick), for: .touchUpInside)
        favoriteBtn.addTarget(self, action: #selector(favoriteClick), for: .touchUpInside)
        closeBtn.addTarget(self, action: #selector(closeClick), for: .touchUpInside)
        
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.leading.trailing.equalTo(scrollView.frameLayoutGuide).inset(20)
            make.top.bottom.equalTo(scrollView.contentLayoutGuide).inset(20)
        }
        
        img.snp.makeConstraints { make in
            make.height.equalTo(500)
        }
        
        closeBtn.backgroundColor = .black.withAlphaComponent(0.5)
        closeBtn.layer.cornerRadius = 20
        closeBtn.imageView?.tintColor = .white
        closeBtn.setImage(UIImage(systemName: "x.circle"), for: .normal)
        addSubview(closeBtn)
        closeBtn.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).inset(20)
            make.size.equalTo(40)
        }
                
        contentStack.addArrangedSubview(img)
        contentStack.addArrangedSubview(playBtn)
        contentStack.addArrangedSubview(favoriteBtn)
        contentStack.addArrangedSubview(title)
        contentStack.addArrangedSubview(author)
        contentStack.addArrangedSubview(desc)
        contentStack.addArrangedSubview(UIView())
        
        playBtn.tintColor = .systemBlue
        playBtn.setTitle("Play", for: .normal)
        
        favoriteBtn.tintColor = .systemYellow
        favoriteBtn.setTitle("Add to favorites", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(data: BookModel){
        if data.isLiked {
            favoriteBtn.tintColor = .red
            favoriteBtn.setTitle("Delete from favorites", for: .normal)

        } else {
            favoriteBtn.tintColor = .systemYellow
            favoriteBtn.setTitle("Add to favorites", for: .normal)
        }
        
        img.image = UIImage(named: data.imageName)
        
        title.text = data.title
        author.text = data.author
        desc.text = data.description
        
        title.textColor = .label
        author.textColor = .secondaryLabel
        desc.textColor = .tertiaryLabel
        
        title.numberOfLines = 0
        author.numberOfLines = 0
        desc.numberOfLines = 0
    }
    
    @objc func favoriteClick(){
        favoriteClickCallback?()
    }
    
    @objc func playClick(){
        playClickCallback?()
    }
    
    @objc func closeClick(){
        closeClickCallback?()
    }
}
