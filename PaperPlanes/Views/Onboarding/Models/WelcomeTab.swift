//
//  CarouselPage.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/25/23.
//

import Foundation

enum WelcomeTab {
    case one
    case two
    case three
    case four
    
    var title: String {
        switch self {
        case .one:
            return "Welcome"
        case .two:
            return "Two"
        case .three:
            return "Three"
        case .four:
            return "Four"
        }
    }
}
