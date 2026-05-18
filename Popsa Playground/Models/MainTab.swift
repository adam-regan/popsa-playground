//
//  MainTab.swift
//  Popsa Playground
//
//  Created by Adam Regan on 18/05/2026.
//

import UIKit

enum MainTab: Int, CaseIterable {
    case designs   = 0
    case reminders = 1
    case memories  = 2
    case basket    = 3
    case account   = 4

    var title: String {
        switch self {
        case .designs:   return "Designs"
        case .reminders: return "Reminders"
        case .memories:  return "Memories"
        case .basket:    return "Basket"
        case .account:   return "Account"
        }
    }

    var image: UIImage? {
        switch self {
        case .designs:   return UIImage(systemName: "square.grid.2x2")
        case .reminders: return UIImage(systemName: "bell")
        case .memories:  return UIImage(systemName: "photo.on.rectangle")
        case .basket:    return UIImage(systemName: "basket")
        case .account:   return UIImage(systemName: "person.circle")
        }
    }

    var selectedImage: UIImage? {
        switch self {
        case .designs:   return UIImage(systemName: "square.grid.2x2.fill")
        case .reminders: return UIImage(systemName: "bell.fill")
        case .memories:  return UIImage(systemName: "photo.on.rectangle.fill")
        case .basket:    return UIImage(systemName: "basket.fill")
        case .account:   return UIImage(systemName: "person.circle.fill")
        }
    }
}
