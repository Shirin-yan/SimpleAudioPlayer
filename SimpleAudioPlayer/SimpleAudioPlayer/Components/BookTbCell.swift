//
//  BookTbCell.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/12/23.
//

import UIKit
import SnapKit

class BookTbCell: UITableViewCell {

    var image = UIImageView()
    
    let textStack: UIStackView = {
        let s = UIStackView()
        s.alignment = .fill
        s.axis = .vertical
        s.spacing = 6
        return s
    }()
    

    var title = UILabel()
    var author = UILabel()

    var desc = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(image)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10))
            make.width.equalTo(125)
            make.height.equalTo(140).priority(.high)
        }
        
        contentView.addSubview(textStack)
        textStack.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(10)
            make.top.bottom.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
            make.height.equalTo(140).priority(.high)
        }
        
        textStack.addArrangedSubview(title)
        textStack.addArrangedSubview(author)
        textStack.addArrangedSubview(desc)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(data: BookModel){
        image.image = UIImage(named: data.imageName)
        
        title.text = data.title
        author.text = data.author
        desc.text = data.description
        
        title.textColor = .label
        author.textColor = .secondaryLabel
        desc.textColor = .tertiaryLabel
        
        title.numberOfLines = 0
        author.numberOfLines = 0
        desc.numberOfLines = 4
    }
}
