//
//  Searchbar.swift
//  TmAuction
//
//  Created by Shirin on 12/17/22.
//

import UIKit
import SnapKit

class Searchbar: UISearchBar {

    var beginEditingCallback: ( () -> Void )?
    var cancelClickCallback: (() -> Void)?
    var searchClickCallback: (() -> Void)?
    var editingCallback: ((String?) -> Void)?
    var timer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        delegate = self
        searchBarStyle = .minimal
        isTranslucent = false
        searchTextField.placeholder = placeholder
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func delayedSearch(){
        editingCallback?(text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
    }
}

extension Searchbar: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        if beginEditingCallback != nil {
            beginEditingCallback?()
            return false
        }

        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.showsCancelButton = true
        searchBar.sizeToFit()
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.showsCancelButton = false
        searchBar.sizeToFit()
        searchBar.resignFirstResponder()
        cancelClickCallback?()
        editingCallback?(text)
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchClickCallback?()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        editingCallback?(searchText.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}
