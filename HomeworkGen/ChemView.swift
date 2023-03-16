//
//  ChemView.swift
//  HomeworkGen
//
//  Created by Nethan on 13/3/23.
//

import SwiftUI
import OpenAISwift


struct ChemView: View {
    @ObservedObject var viewModel = GPTModel()
    @State var topic = ""
    @State var qn = ""
    @State var text = ""
    @State var models = [String]()

    @State var select = "Primary"
    @State var selection = ["Primary", "Secondary", "Post secondary", "University"]
    @State var essayie = ""
    @FocusState var focus: Bool
    var body: some View {
        NavigationView {
            List {
                TextField("Tell me your question", text: $qn)
                    .focused($focus)
             
                TextField("Topic", text: $topic)
                    .focused($focus)
                    
                Picker(selection: $select, label: Text("Education level:")) {
                    ForEach(selection, id: \.self) { level in
                        Text(level)
                    }
                }
                HStack {
                    Spacer()
                    Button("Ask question") {
                        if topic.trimmingCharacters(in: .whitespaces) != "" {
                            text = "I have a chemistry question: '\(qn)'. This is of the topic '\(topic)'. Give an answer suitable of the \(select) level"
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
            .navigationTitle("Chemistry help")
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

struct ChemView_Previews: PreviewProvider {
    static var previews: some View {
        ChemView()
    }
}
