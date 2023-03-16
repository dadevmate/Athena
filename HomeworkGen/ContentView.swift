//
//  ContentView.swift
//  HomeworkGen
//
//  Created by Nethan on 13/3/23.
//

import SwiftUI
import ChatGPTSwift
struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
  
           Text("HomeworkGen")
                .fontWeight(.bold)
                .font(.largeTitle)
            Spacer()
       
            HStack {
                Spacer()
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "a.square")
                            .font(.largeTitle)
                          
                    }
                    Text("English")
                        .foregroundColor(.secondary)
                }
                Spacer()
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "function")
                            .font(.largeTitle)
                    }
                    Text("Math")
                        .foregroundColor(.secondary)
                }
                    Spacer()
                
                VStack {
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "aqi.high")
                            .font(.largeTitle)
                    }
                    Text("Chemistry")
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "lightbulb")
                            .font(.largeTitle)
                    }
                    Text("Physics")
                        .foregroundColor(.secondary)
                }
                Spacer()
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "pawprint")
                            .font(.largeTitle)
                    }
                    Text("Biology")
                        .foregroundColor(.secondary)
                }
                    Spacer()
                
                VStack {
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "leaf")
                            .font(.largeTitle)
                    }
                    Text("Geography")
                        .foregroundColor(.secondary)
            
                }
                Spacer()
                
            }
          
            Spacer()
            
            HStack {
                Spacer()
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "paintpalette")
                            .font(.largeTitle)
                    }
                    Text("Art")
                        .foregroundColor(.secondary)
                }
                Spacer()
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "globe.europe.africa")
                            .font(.largeTitle)
                    }
                    Text("Languages")
                        .foregroundColor(.secondary)
                }
                Spacer()
       
            }
            Spacer()
            
            HStack {
                Spacer()
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "briefcase")
                            .font(.largeTitle)
                    }
                    Text("ToS summariser")
                        .foregroundColor(.secondary)
                }
                Spacer()
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "bubble.right")
                            .font(.largeTitle)
                    }
                    Text("Just talk!")
                        .foregroundColor(.secondary)
                }
                Spacer()
                Spacer()
            }
           
   
          
        }
        .padding()
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
