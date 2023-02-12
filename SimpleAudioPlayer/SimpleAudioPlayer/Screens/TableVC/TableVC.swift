//
//  TableVC.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/12/23.
//

import UIKit

class TableVC: UIViewController {
    
    var type: TabbarPageType = .main
    
    var data: [BookModel] = []
    
    var mainView: TableView {
        return view as! TableView
    }
    
    override func loadView() {
        super.loadView()
        view = TableView()
        view.backgroundColor = .white
    }
    
    required init(type: TabbarPageType) {
        super.init(nibName: nil, bundle: nil)
        mainView.search.isHidden = true
        self.type = type
        data = SongData.shared.data
        
        if type == .search {
            mainView.search.isHidden = false
            return
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        mainView.search.editingCallback = { [weak self] key in
            guard let key = key else { return }
            if key.isEmpty {
                self?.data = SongData.shared.data
            } else {
                let data = SongData.shared.data
                self?.data = data.filter({$0.description.contains(key) || $0.title.contains(key) || $0.author.contains(key) })
            }
            self?.mainView.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if type == .liked {
            let liked = AccountUserDefaults.liked
            data = SongData.shared.data.filter({ liked.contains($0.id) })
            mainView.noContentView.isHidden = !data.isEmpty
            mainView.tableView.reloadData()
            return
        }
    }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookTbCell
        cell.setupData(data: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = BookDetailVC()
        vc.data = data[indexPath.row]
        
//        let vc = FullScreenPlayerVC()
        present(vc, animated: true)
    }
}
