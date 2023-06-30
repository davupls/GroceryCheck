//
//  CheckboxView.swift
//  GroceryCheck
//
//  Created by David Mclean on 6/30/23.
//

import SwiftUI

struct CheckboxView: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            
            configuration.isOn.toggle()
            
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .font(.title)
                configuration.label
            }
        })
        .foregroundColor(.black)
    }
}

//#Preview {
//    CheckboxView()
//}
