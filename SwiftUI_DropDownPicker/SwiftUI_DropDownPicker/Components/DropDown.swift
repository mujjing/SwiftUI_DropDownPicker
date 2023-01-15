//
//  DropDown.swift
//

import Foundation
import SwiftUI

struct DropDown: View {
    /// - Drop Down Properties
    var content: [String]
    var activeTint: Color
    var inActiveTint: Color
    @Binding var selection: String
    @State private var expendView: Bool = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                ForEach(content) { title in
                    RowView(title, size)
                }
            }
        }
        .frame(height: 55)
    }
    
    @ViewBuilder
    func RowView(_ title: String, _ size: CGSize) -> some View {
        
    }
}
