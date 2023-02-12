//
//  NoContentView.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/12/23.
//

import UIKit
import SnapKit

class NoContentView: UIView {

    let contentStack: UIStackView = {
        let s = UIStackView()
        s.alignment = .center
        s.distribution = .equalCentering
        s.axis = .vertical
        s.spacing = 20
        return s
    }()
    
    let img = UIImageView(image: UIImage(systemName: "heart.fill"))
    
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.center.equalTo(self.safeAreaLayoutGuide)
        }
        
        contentStack.addArrangedSubview(img)
        contentStack.addArrangedSubview(title)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        title.text = "No liked products"

        img.contentMode = .scaleAspectFit
        img.snp.makeConstraints { make in
            make.size.equalTo(100)
        }
    }
}
