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
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(content, id: \.self) { title in
                    RowView(title, size)
                }
            }
            .background {
                Rectangle()
                    .fill(inActiveTint)
            }
            /// Moving View Based on the Selection
            .offset(y: (CGFloat(content.firstIndex(of: selection) ?? 0) * -55))
        }
        .frame(height: 55)
        .overlay(alignment: .trailing) {
            Image(systemName: "chevron.up.chevron.down")
                .padding(.trailing, 10)
        }
        .mask(alignment: .top) {
            Rectangle()
                .frame(height: expendView ? CGFloat(content.count) * 55 : 55)
            /// Moving the Mask Based on the Selection, so that Every Content Will be Visible
                .offset(y: expendView ? (CGFloat(content.firstIndex(of: selection) ?? 0) * -55) : 0)
        }
    }
    
    @ViewBuilder
    func RowView(_ title: String, _ size: CGSize) -> some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.horizontal)
            .frame(width: size.width, height: size.height, alignment: .leading)
            .background {
                if selection == title {
                    Rectangle()
                        .fill(activeTint)
                        .transition(.identity)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    /// If Expended then Make Selection
                    if expendView {
                        selection = title
                        expendView = false
                    } else {
                        /// Disabling Outside Taps
                        if selection == title {
                            expendView = true
                        }
                    }
                }
            }
    }
}
