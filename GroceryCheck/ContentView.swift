//
//  ContentView.swift
//  GroceryCheck
//
//  Created by David Mclean on 6/30/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query private var grocery: [GroceryModel]
    
    
    
    
    @State private var isOn = false
    @State private var dataEntered = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(grocery, id: \.id) { item in
                        HStack {
                            
                            Text(item.itemName)
                        }
                    }
                    .onDelete( perform: deleteEntry)
                    
                }
                .listStyle(.plain)
                .toolbar {
                    EditButton()
                }
                
                VStack {
                    TextField("Enter Grocery Item", text: $dataEntered)
                        .onSubmit {
                            withAnimation {
                                // Initiate a instance of model then insert
                                let newId = UUID()
                                let newItem = GroceryModel(id: newId, item: dataEntered, checkStatus: false)
                                context.insert(newItem)
                                dataEntered = ""
                            }
                        }
                }
                
                .padding(.horizontal)
            }
            .navigationTitle("Grocery List")
            
        }
        .padding()
    }
    
    private func deleteEntry(offset: IndexSet) {
        withAnimation {
            for index in offset {
                context.delete(grocery[index])
            }
        }
    }
}

#Preview {
    ContentView()
}
