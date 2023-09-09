//
//  ScapeaAvatar.swift
//  Scapea
//
//  Created by Sanjeev RM on 08/09/23.
//

import Foundation

enum ScapeaAvatar: CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var scapeaImageName: String {
        switch self {
        case .one: return "avatar.one.image"
        case .two: return "avatar.two.image"
        case .three: return "avatar.three.image"
        case .four: return "avatar.four.image"
        case .five: return "avatar.five.image"
        case .six: return "avatar.six.image"
        case .seven: return "avatar.seven.image"
        case .eight: return "avatar.eight.image"
        case .nine: return "avatar.nine.image"
        }
    }
}
