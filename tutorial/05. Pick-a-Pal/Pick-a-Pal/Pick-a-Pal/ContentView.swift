//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    /**
     옵셔널이 좋을까? 빈값 초기화가 좋을까?
     */
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    
    var body: some View {
        VStack {
            
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.main)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? "" : pickedName)
                .bold()
                .font(.title2)
                .foregroundStyle(.main)
            
            List{
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))

            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                            nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            
            Button {
                //names 엘리먼트는 옵셔널
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll() { name in
                            return name == pickedName
                        }
                        
                    }
                    
                } else{
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.main)
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
