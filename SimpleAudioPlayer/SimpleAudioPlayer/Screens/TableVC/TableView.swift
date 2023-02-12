//
//  TableView.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/12/23.
//

import UIKit
import SnapKit

class TableView: UIView {

    let contentStack: UIStackView = {
        let s = UIStackView()
        s.alignment = .fill
        s.axis = .vertical
        s.spacing = 10
        s.isLayoutMarginsRelativeArrangement = true
        s.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return s
    }()
    
    let search = Searchbar()
    
    let tableView: UITableView = {
        let t = UITableView()
        t.register(BookTbCell.self, forCellReuseIdentifier: "cell")
        t.rowHeight = UITableView.automaticDimension
        t.showsVerticalScrollIndicator = false
        t.contentInset.bottom = 100
        return t
    }()
    
    let noContentView = NoContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        addSubview(noContentView)
        noContentView.isHidden = true
        noContentView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }

        contentStack.addArrangedSubview(search)
        contentStack.addArrangedSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
