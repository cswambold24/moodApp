//
//  HomeView.swift
//  A5StringTestThing
//
//  Created by Carver Wambold24 on 2/13/24.
//

import SwiftUI

struct HomeView: View {
    @State var emotionCheck = false
    @State var moodCheck = false
    var body: some View {
        NavigationView(content: {
            ZStack {
                Image("P1Image")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack {
                    Text("Log an Emotion or Mood")
                        .offset(y: -180)
                        .font(.title)
                        .foregroundStyle(Color.black)
                        .fontWeight(.bold)
                        .frame(width: 250)
                        .multilineTextAlignment(.center)
                    
                    EmotionView(isToggled: $emotionCheck)
                        .onTapGesture {
                            emotionCheck.toggle()
                            if moodCheck {
                                moodCheck.toggle()
                            }
                        }
                    MoodView(isToggled: $moodCheck)
                        .onTapGesture {
                            moodCheck.toggle()
                            if emotionCheck {
                                emotionCheck.toggle()
                            }
                        }
                  
                        nextButton
                            .offset(y: emotionCheck || moodCheck ? 0 : 175)
                            .animation(.easeInOut, value: emotionCheck || moodCheck)
                }
            }
        })
    }
}




extension HomeView {
    var nextButton: some View {
            NavigationLink {
                InputView()
            } label: {
                Text("Next")
                    .foregroundColor(Color.black)
                    .fontWeight(.bold)
                    .frame(width: 325, height: 40)
                    .background(Color.accentColor)
                    .cornerRadius(20)
            }
            .disabled(moodCheck == false && emotionCheck == false)
    }
}






#Preview {
    HomeView()
}
