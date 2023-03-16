//
//  DalleView.swift
//  HomeworkGen
//
//  Created by Nethan on 13/3/23.
//
import SwiftUI

struct DalleView: View {
    @State var typingMessage: String = ""
    @ObservedObject var dalleViewModel = DalleViewModel()
    @Namespace var bottomID
    @AppStorage("maxgen") var maxgen = 0
    @AppStorage("limit") var limit = false
    var body: some View {
        NavigationView(){
            VStack(alignment: .leading){
                
                if !dalleViewModel.messages.isEmpty{
                    ScrollViewReader { reader in
                        ScrollView(.vertical) {
                            ForEach(dalleViewModel.messages.indices, id: \.self){ index in
                                let message = dalleViewModel.messages[index]
                                HStack {
                                    Image(globalAvatar)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    MessageView(message: message)
                                }
                            }
                            Text("").id(bottomID)
                        }
                        .onAppear{
                            withAnimation{
                                reader.scrollTo(bottomID)
                            }
                        }
                        .onChange(of: dalleViewModel.messages.count){ _ in
                            withAnimation{
                                reader.scrollTo(bottomID)
                            }
                        }
                    }
                } else {
                    VStack {
                        Image("Athena")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                            .font(.largeTitle)
                        Text("An image will be generated here")
                            .font(.subheadline)
                            .padding(10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                HStack(alignment: .center){
                    TextField("Describe your image...", text: $typingMessage, axis: .vertical)
                        .padding()
                        .foregroundColor(.white)
                        .lineLimit(3)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    Button {
                      
                        maxgen += 1
                        if maxgen > 15 {
                            limit = true
                        }
                        if limit == false {
                          
                            Task{
                                if !typingMessage.trimmingCharacters(in: .whitespaces).isEmpty{
                                    let tempMessage = typingMessage
                                    typingMessage = ""
                                    await dalleViewModel.generateImage(prompt: tempMessage)
                                }
                            }
                        }
                        
                    } label: {
                        Image(systemName: typingMessage == "" ? "circle" : "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(typingMessage == "" ? .white.opacity(0.75) : .white)
                            .frame(width: 20, height: 20)
                            .padding()
                    }
                    .alert("Limit reached!", isPresented: $limit) {
                        
                    } message: {
                        Text("You've reached the maximum amount of images you can generate, which is 15. We're sorry about this, but we're running on a budget. Try out some of the other features our app can do.")
                    }
                }
                .onDisappear {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                }
                .background(Color(red: 63/255, green: 66/255, blue: 78/255, opacity: 1))
                .cornerRadius(12)
                .padding([.leading, .trailing, .bottom], 10)
                .shadow(color: .black, radius: 0.5)
            }
            .background(Color.black)
            .navigationTitle("Limit: \(maxgen)/15 images")
        }
    }
}

struct DalleView_Previews: PreviewProvider {
    static var previews: some View {
        DalleView()
    }
}
