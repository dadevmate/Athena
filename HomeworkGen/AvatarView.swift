//
//  AvatarView.swift
//  HomeworkGen
//
//  Created by Nethan on 13/3/23.
//

import SwiftUI

struct AvatarView: View {
    @AppStorage("avatar") var avatar = ""
    @State var selected = false
    var body: some View {
        NavigationView {
            List {
                Section {
                    
                } footer : {
                    Text("These are AI generated art pieces by DALL E")
                }
                
                Section {
                    HStack {
                        Spacer()
                        Image("owl")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Spacer()
                    }
                }
                .onTapGesture {
                    avatar = "owl"
                    globalAvatar = "owl"
                    selected = true
                    
                }
                .alert("Avatar selected", isPresented: $selected) {
                    
                }
                Section {
                    HStack {
                        Spacer()
                        Image("cool cat")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Spacer()
                    }
                }
                .onTapGesture {
                    avatar = "cool cat"
                    globalAvatar = "cool cat"
                    selected = true
                }
                .alert("Avatar selected", isPresented: $selected) {
                    
                }
                Section {
                    HStack {
                        Spacer()
                        Image("landscape1")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Spacer()
                    }
                }
                .onTapGesture {
                    avatar = "landscape1"
                    globalAvatar = "landscape1"
                    selected = true
                }
                .alert("Avatar selected", isPresented: $selected) {
                    
                }
                
                Section {
                    HStack {
                        Spacer()
                        Image("landscape2")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Spacer()
                    }
                }
                .onTapGesture {
                    avatar = "landscape2"
                    globalAvatar = "landscape2"
                    selected = true
                }
                .alert("Avatar selected", isPresented: $selected) {
                    
                }
                Section {
                    HStack {
                        Spacer()
                        Image("landscape3")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Spacer()
                    }
                }
                .onTapGesture {
                    avatar = "landscape3"
                    globalAvatar = "landscape3"
                    selected = true
                }
                .alert("Avatar selected", isPresented: $selected) {
                    
                }
                Section {
                    HStack {
                        Spacer()
                        Image("billionaire")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Spacer()
                    }
                }
                .onTapGesture {
                    avatar = "billionaire"
                    globalAvatar = "billionaire"
                    selected = true
                }
                .alert("Avatar selected", isPresented: $selected) {
                    
                }
                Section {
                    HStack {
                        Spacer()
                        Image("cool guy")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Spacer()
                    }
                }
                .onTapGesture {
                    avatar = "cool guy"
                    globalAvatar = "cool guy"
                    selected = true
                }
                .alert("Avatar selected", isPresented: $selected) {
                    
                }
                Section {
                    HStack {
                        Spacer()
                        Image("sad guy")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Spacer()
                    }
                }
                .onTapGesture {
                    avatar = "sad guy"
                    globalAvatar = "sad guy"
                    selected = true
                }
                .alert("Avatar selected", isPresented: $selected) {
                    
                }
            }
            .navigationTitle("Choose an avatar")
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
