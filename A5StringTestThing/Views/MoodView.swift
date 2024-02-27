//
//  MoodView.swift
//  A5StringTestThing
//
//  Created by Carver Wambold24 on 2/13/24.
//

import SwiftUI

struct MoodView: View {
    @Binding var isToggled: Bool
    var body: some View {
        HStack{
            VStack ( alignment: .leading) {
                HStack{
                    Image(systemName: "sun.horizon")
                    Text("Mood")
                }
                Text("How you've felt overall today")
            }
            if isToggled {
                Image(systemName: "checkmark")
                    .font(.title)
                    .offset(x: 30)
                    .foregroundColor(Color.accentColor)
            }
        }
        .padding()
        .frame(width: 325, height: 115, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.thickMaterial)
        )
    }
}


