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
    case five
    
    var title: String {
        switch self {
        case .one:
            return "Hello! It's great to see a new face around here."
        case .two:
            return "A little bit about this place - "
        case .three:
            return "What this place is *not*"
        case .four:
            return "This is not a place for cold responses or cruel jokes."
        case .five:
            return "If you're ready to give and receive kindness, please press the button below!"
        }
    }
    
    var desc: String {
        switch self {
        case .one:
            return "My name is Gato, and I'll be your guide around here. It's wonderful to meet you."
        case .two:
            return "Paper Planes is a safe space to connect with real people around the world. We try to encourage kindness and connection here."
        case .three:
            return "This is not a place for dating or sharing personal information, so for your own safety please avoid sharing any personal details or contact information!"
        case .four:
            return "If you run into any jerks or mean-spirited paper planes, please report them!"
        case .five:
            return "We're happy to have you here!"
        }
    }
}
