//
//  CustomButtonStyle.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/25/23.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: 60)
            .font(.title3)
            .background(Color.white)
            .foregroundStyle(.black)
            .cornerRadius(15)
    }
}
