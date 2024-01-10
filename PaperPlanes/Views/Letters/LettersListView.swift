//
//  LettersListView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/28/23.
//

import SwiftUI

struct LettersListView: View {
    // Viewing letters - include option to create a new letter
    var body: some View {
        //Option to either reply or skip
        Text("View letters other people have sent here")
        Text("Reply to letters and send your own")
    }
}

struct LettersListView_Previews: PreviewProvider {
    static var previews: some View {
        LettersListView()
    }
}
