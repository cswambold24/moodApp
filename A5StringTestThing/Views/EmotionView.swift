//
//  EmotionView.swift
//  A5StringTestThing
//
//  Created by Carver Wambold24 on 2/13/24.
//

import SwiftUI

struct EmotionView: View {
    @Binding var isToggled: Bool
     @State var date = Date()
    
     var timeFormat: DateFormatter {
         let formatter = DateFormatter()
         formatter.dateFormat = "hh:mm a"
         return formatter
     }
     var updateTimer: Timer {
          Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                               block: {_ in
                                  self.date = Date()
                                })
     }
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack{
                    Image(systemName: "clock")
                    Text("Emotion")
                }
                Text("How you feel right now")
                Text(timeString(date: date))
                    .onAppear(perform: {let _ = self.updateTimer})
            }
            if isToggled {
                Image(systemName: "checkmark")
                    .font(.title)
                    .offset(x: 65)
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
    
    
    
    private func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
   }
    
    
    
}

