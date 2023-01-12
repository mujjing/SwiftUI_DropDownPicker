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
        }
        .frame(height: 55)
    }
}
