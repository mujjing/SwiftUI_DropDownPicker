//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String = "Easy"
    var body: some View {
        VStack {
            DropDown(
                content: ["Easy", "Normal", "Hard", "Expert"],
                activeTint: .primary.opacity(0.1),
                inActiveTint: .white.opacity(0.05),
                selection: $selection
            )
            .frame(width: 130)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environment(\.colorScheme, .dark)
        .background {
            Color("BG")
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
