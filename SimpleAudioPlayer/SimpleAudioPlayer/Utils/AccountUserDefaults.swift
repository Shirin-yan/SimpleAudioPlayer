//
//  AccountUserDefaults.swift
//  TmAuction
//
//  Created by Shirin on 12/22/22.
//

import Foundation

private enum Defaults: String {
    case liked = "liked"
}

class AccountUserDefaults {

    static var liked: [Int] {
        set { _set(value: newValue, key: .liked)  }
        get { return _get(valueForKey: .liked) as? [Int] ?? []}
    }

    private static func _set(value: Any?, key: Defaults) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }

    private static func _get(valueForKey key: Defaults)-> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
}
