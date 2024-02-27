//
//  InputView.swift
//  A5StringTestThing
//
//  Created by Carver Wambold24 on 2/13/24.
//

import SwiftUI

struct InputView: View {
    @State var input: String = ""
    @State var textFieldHeight: CGFloat = 50
    @State var showResultText = false
    @State var output: [String] = ["how im feeling go here", "PRAHSR DOES GO HERE"]
    @State private var showResult = false
    @State private var opacityResultOne = 0.0
    @State private var opacityResultTwo = 0.0
    @State private var animateFlower = true

    var body: some View {
        ZStack{
            Image("P1Image")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack{
                FlowerView(animateFlower: $animateFlower)
                                .frame(width: 300, height: 300, alignment: .center)
                HStack{
                    VStack {
                        Text("Describe your feeling or mood")
                        TextField("", text: $input, axis: .vertical)
                            .lineLimit(4)
                            .padding()
                            .animation(.easeInOut, value: input.isEmpty)
                            .frame(minWidth: 275, maxHeight: input.isEmpty ? 50 : 150, alignment: .top )
                            
                            .background(
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.ultraThinMaterial)
                                        .animation(.easeInOut, value: input.isEmpty)
                                    if input.isEmpty == false {
                                        Button {
                                            print("button pressed")
                                            output = ViewModel().analyzeMood(input: input)
                                            delayText()
                                            withAnimation{
                                                showResultText.toggle()
                                            }
                                        } label: {
                                            Text("continue")
                                                .animation(.easeInOut, value: input.isEmpty)
                                            
                                        }
                                        .offset(x: 95, y: 60)
                                    }
                                    
                                }
                            )
                            
                    }.offset(x: 85, y: -85)
                    
                    ///  CUTOFF
                    VStack{
                        Text("It sounds like you are feeling: ")
                            .font(.title3)
                            .fontWeight(.thin)
                            .padding(20)
                      
                            Text(output[0])
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(20)
                                .opacity(opacityResultOne)
                                .onChange(of: showResult == false, {
                                    withAnimation(.easeInOut) {
                                        opacityResultOne = 1.0
                                        }
                                })
                                
                        
                  
                            Text(output[1])
                                .font(.title3)
                                .padding(20)
                                .opacity(opacityResultTwo)
                                .onChange(of: showResult == false, {
                                    withAnimation(.easeInOut.delay(1.0)) {
                                        opacityResultTwo = 1.0
                                        }
                                })
                                
                        
                    }
                    .frame(width: 350, height: 300)
                    .background(
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.regularMaterial)
                        }
                        
                    )
                    .offset(x: 300, y: -200)
                }
                .offset(x: { if showResultText /*!= true*/ { -440} else { 100 }}())
                
                        
                
               
            }
           
        }
    }
    
    private func delayText() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            showResult = true
        }
    }
    
}



#Preview {
    InputView()
}
