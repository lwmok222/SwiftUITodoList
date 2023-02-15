//
//  ListView.swift
//  SwiftUITodoList
//
//  Created by Eric Mok on 16/11/2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    // @State can only be used in  View
//    @State var items: [ItemModel]  = [
//        ItemModel(title: "This is  first title", isCompleted: false),
//        ItemModel(title: "This is  second title", isCompleted: true),
//        ItemModel(title: "Third title", isCompleted: false),
//    ]
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                       ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: { indexSet in
                        listViewModel.deleteItem(indexSet: indexSet)
                    })
                    .onMove { indexSet, newOffset in
                        listViewModel.moveItem(from: indexSet, to: newOffset)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
        .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                    .previewDisplayName("iPhone 12 Pro")
    }
}


