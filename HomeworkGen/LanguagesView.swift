//
//  LanguagesView.swift
//  HomeworkGen
//
//  Created by Nethan on 13/3/23.
//

import SwiftUI
import OpenAISwift


struct LangView: View {
    @ObservedObject var viewModel = GPTModel()
    @State var topic = ""
    @State var qn = ""
    @State var text = ""
    @State var models = [String]()

  
    @State var essayie = ""
    @FocusState var focus: Bool
    var body: some View {
        NavigationView {
            List {
                TextField("Sentence you want to translate:", text: $qn)
                    .focused($focus)
             
                TextField("Language to be translated into:", text: $topic)
                    .focused($focus)
                    
         
                
                HStack {
                    Spacer()
                    Button("Translate") {
                        if topic.trimmingCharacters(in: .whitespaces) != "" {
                            text = "Translate '\(qn)' into the language '\(topic)'. If you don't know how to translate the text into the given language, say that you don't know how to speak that language."
                            send()
                        }
                    }
                    Spacer()
                }
                Section {
                    HStack {
                        Spacer()
                        Text("Your answer here:")
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        if essayie == "" {
                            DotLoadingView()
                                .frame(width: 70, height: 70)
                        } else {
                            Text(essayie)
                        }
                        Spacer()
                    }
                   
                }
            }
            .navigationTitle("Languages help")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        focus.toggle()
                    }
                }
            }
        }
        .onAppear {
            viewModel.setup()
        }
     
      
    }
    
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        models.append("\(text)")
        viewModel.send(text: text) { response in
            DispatchQueue.main.async {
       
           essayie = response
                self.text = ""
        
              
            }
          
        }
    }
}

struct LangView_Previews: PreviewProvider {
    static var previews: some View {
        LangView()
    }
}
