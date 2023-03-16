//
//  EnglishView.swift
//  HomeworkGen
//
//  Created by Nethan on 13/3/23.
//

import SwiftUI
import OpenAISwift
final class GPTModel: ObservableObject {
    init() {}
    
    private var client: OpenAISwift?
    
    func setup() {
        client = OpenAISwift(authToken: "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")
    }
    
    func send(text: String, completion: @escaping (String) -> Void) {
        
   
        client?.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(output)
            case.failure:
                break
            }
        })
    }
}

struct EnglishView: View {
    @ObservedObject var viewModel = GPTModel()
    @State var topic = ""
    @State var text = ""
    @State var models = [String]()
    @State var val = 50.0
    @State var select = "Primary"
    @State var selection = ["Primary", "Secondary", "Post secondary", "University"]
    @State var essayie = ""
    @FocusState var focus: Bool
    var body: some View {
        NavigationView {
            List {
                TextField("Describe your essay topic", text: $topic)
                    .focused($focus)
                Stepper(value: $val, in: 50...5000) {
                    Text("Number of words: \(Int(val))")
                }
            
                Slider(
                         value: $val,
                         in: 50...5000
                       
                     )
                    
                Picker(selection: $select, label: Text("Education level:")) {
                    ForEach(selection, id: \.self) { level in
                        Text(level)
                    }
                }
                HStack {
                    Spacer()
                    Button("Generate Essay") {
                        if topic.trimmingCharacters(in: .whitespaces) != "" {
                            text = "Write me an essay of the topic \(topic) with \(val) number of words of the education level \(select)"
                            send()
                        }
                    }
                    Spacer()
                }
                Section {
                    HStack {
                        Spacer()
                        Text("Your essay here:")
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
            .navigationTitle("English help")
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

struct EnglishView_Previews: PreviewProvider {
    static var previews: some View {
        EnglishView()
    }
}
