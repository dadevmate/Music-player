//
//  ContentView.swift
//  Music player
//
//  Created by Nethan on 17/2/23.
//

import SwiftUI
import MusicKit



extension Animation {
    static func ripple() -> Animation {
        Animation.default
    }
}







struct ContentView: View {
    @State var pauseStatus = false
    @State var forward = false
    @State var backward = false
    @State var size = 266
    @State var colors = [Color.red, Color.pink, Color.blue, Color.purple, Color.yellow]
    @State var coordinates1 = [0, 0]
    @State var coordinates2 = [0, 0]
    @State var coordinates3 = [0, 0]
    @State var coordinates4 = [0, 0]
    @State var coordinates5 = [0, 0]
    @State var coordinates6 = [0, 0]
    @State var coordinates7 = [0, 0]
    @State var coordinates8 = [0, 0]
    @State var chosenColor = Color.red
    @State var musicView = false
    @State private var selection = 0
      let items = ["airpodspro", "airpods.gen3", "airpodsmax", "applelogo"]
    var body: some View {
        VStack {
           
        
         
                ZStack {
                    
            
                      
                        VStack {
                            Text("")
                        }
                        .border(Color.red)
                        .frame(width: CGFloat(size), height: CGFloat(size))
                        .background(Color(red: 0.8, green: 0.8, blue: 0.8))
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        
                    Text(".")
                        .foregroundColor(colors.randomElement())
                        .font(.largeTitle)
                        .position(x: CGFloat(coordinates1[0]), y: CGFloat(coordinates1[1]))
                    Text(".")
                        .foregroundColor(colors.randomElement())
                        .font(.system(size: 30))
                        .position(x: CGFloat(coordinates2[0]), y: CGFloat(coordinates2[1]))
                    Text(".")
                        .foregroundColor(colors.randomElement())
                        .font(.largeTitle)
                        .position(x: CGFloat(coordinates3[0]), y: CGFloat(coordinates3[1]))
                    Text(".")
                        .foregroundColor(colors.randomElement())
                        .font(.largeTitle)
                        .position(x: CGFloat(coordinates4[0]), y: CGFloat(coordinates4[1]))
                    Text(".")
                        .foregroundColor(colors.randomElement())
                        .font(.largeTitle)
                        .position(x: CGFloat(coordinates5[0]), y: CGFloat(coordinates5[1]))
                    Text(".")
                        .foregroundColor(colors.randomElement())
                        .font(.largeTitle)
                        .position(x: CGFloat(coordinates6[0]), y: CGFloat(coordinates6[1]))
                    Text(".")
                        .foregroundColor(colors.randomElement())
                        .font(.largeTitle)
                        .position(x: CGFloat(coordinates7[0]), y: CGFloat(coordinates7[1]))
                    
                    Text(".")
                        .foregroundColor(colors.randomElement())
                        .font(.largeTitle)
                        .position(x: CGFloat(coordinates8[0]), y: CGFloat(coordinates8[1]))
                    
                    
                        Image(systemName: "\(items[selection])")
                            .foregroundColor(.primary)
                            .foregroundColor(.accentColor)
                            .font(.system(size: 100))
                      
                        
                      
                    
        
                        
                    
                    
             
                  
                    
                }
                .padding()
                .onAppear {
                    
                    
                    withAnimation(.easeInOut(duration: 0.3).repeatForever()) {
                        size = Int.random(in: 200...301)
                    }
                
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                        
                        let seconds = 0.3
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                            chosenColor = colors.randomElement() ?? Color.blue
                            
                            coordinates1[0] = Int.random(in: 0..<350)
                            coordinates1[1] = Int.random(in: 0..<350)
                            coordinates2[0] = Int.random(in: 0..<350)
                            coordinates2[1] = Int.random(in: 0..<350)
                            coordinates3[0] = Int.random(in: 0..<350)
                            coordinates3[1] = Int.random(in: 0..<350)
                            coordinates4[0] = Int.random(in: 0..<350)
                            coordinates4[1] = Int.random(in: 0..<350)
                            coordinates5[0] = Int.random(in: 0..<350)
                            coordinates5[1] = Int.random(in: 0..<350)
                            coordinates6[0] = Int.random(in: 0..<350)
                            coordinates6[1] = Int.random(in: 0..<350)
                            coordinates7[0] = Int.random(in: 0..<350)
                            coordinates7[1] = Int.random(in: 0..<350)
                            coordinates8[0] = Int.random(in: 0..<350)
                            coordinates8[1] = Int.random(in: 0..<350)
                        }
                        
                        
                        
                        
                        
                        
                    }
                    


                }
            
            
            Picker(selection: $selection, label: Text("Options")) {
                            ForEach(0..<items.count) { index in
                                Image(systemName: items[index])
                            }
                        }.pickerStyle(SegmentedPickerStyle())

                            
         AppleMusicView()
                
            
        
          
        }
    }
}
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.slide
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
