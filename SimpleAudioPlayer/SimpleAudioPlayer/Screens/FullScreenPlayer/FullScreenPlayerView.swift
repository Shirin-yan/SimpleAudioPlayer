//
//  FullScreenPlayerView.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/12/23.
//

import UIKit

class FullScreenPlayerView: UIView {

    let contentStack: UIStackView = {
        let s = UIStackView()
        s.alignment = .fill
        s.axis = .vertical
        s.spacing = 30
        return s
    }()

    let btnStack: UIStackView = {
        let s = UIStackView()
        s.alignment = .center
        s.axis = .horizontal
        s.distribution = .equalCentering
        s.isLayoutMarginsRelativeArrangement = true
        s.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        return s
    }()
    
    let timeStack: UIStackView = {
        let s = UIStackView()
        s.alignment = .fill
        s.axis = .horizontal
        s.distribution = .fillEqually
        return s
    }()

    var img = UIImageView()
    
    var title: UILabel = {
        let t = UILabel()
        t.textColor = .label
        t.numberOfLines = 0
        t.textAlignment = .center
        return t
    }()
    
    var author: UILabel = {
        let t = UILabel()
        t.textColor = .secondaryLabel
        t.numberOfLines = 0
        t.textAlignment = .center
        return t
    }()

    var slider = UISlider()
    
    var remainingTime: UILabel = {
        let t = UILabel()
        t.textColor = .label
        t.numberOfLines = 0
        t.textAlignment = .right
        return t
    }()

    var elapsedTime: UILabel = {
        let t = UILabel()
        t.textColor = .label
        t.numberOfLines = 0
        t.textAlignment = .left
        return t
    }()

    var playBtn: UIButton = {
        let btn = UIButton()
        btn.imageView?.snp.makeConstraints { make in
            make.size.equalTo(60)
        }
        return btn
    }()
    
    var nextBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "forward.end.circle"), for: .normal)
        btn.imageView?.snp.makeConstraints { make in
            make.size.equalTo(50)
        }
        return btn
    }()

    var prevBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "backward.end.circle"), for: .normal)
        btn.imageView?.snp.makeConstraints { make in
            make.size.equalTo(50)
        }
        return btn
    }()

    var errorText = UILabel()
    
    var playClickCallback: (()->())?
    var nextClickCallback: (()->())?
    var prevClickCallback: (()->())?
    var sliderChangedCallback: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        slider.isContinuous = true
        playBtn.addTarget(self, action: #selector(playClick), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(nextClick), for: .touchUpInside)
        prevBtn.addTarget(self, action: #selector(prevClick), for: .touchUpInside)
        slider.addTarget(self, action: #selector(sliderChange), for: .valueChanged)

        addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide).inset(UIEdgeInsets(top: 20, left: 20, bottom: 50, right: 20))
        }

        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height*0.4)
        }

        contentStack.addArrangedSubview(img)
        contentStack.addArrangedSubview(title)
        contentStack.addArrangedSubview(author)
        contentStack.addArrangedSubview(slider)
        contentStack.addArrangedSubview(timeStack)
        contentStack.addArrangedSubview(btnStack)
        contentStack.addArrangedSubview(errorText)
        
        contentStack.setCustomSpacing(20, after: author)
        contentStack.setCustomSpacing(10, after: slider)
        
        timeStack.addArrangedSubview(elapsedTime)
        timeStack.addArrangedSubview(remainingTime)
        
        btnStack.addArrangedSubview(prevBtn)
        btnStack.addArrangedSubview(playBtn)
        btnStack.addArrangedSubview(nextBtn)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func playClick(){
        playClickCallback?()
    }
    
    @objc func nextClick(){
        nextClickCallback?()
    }

    @objc func prevClick(){
        prevClickCallback?()
    }
    
    @objc func sliderChange(){
        sliderChangedCallback?()
    }
}
