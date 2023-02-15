//
//  AddView.swift
//  SwiftUITodoList
//
//  Created by Eric Mok on 16/11/2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var textFieldText: String = ""
    
    @State private var alertTitle: String =  ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here..", text: $textFieldText)
                     .padding(.horizontal)
                     .frame(height: 55)
                     .background(Color(UIColor.secondarySystemBackground))
                     .cornerRadius(10)
                     .padding(.bottom, 5)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(14)
           
        }
        .navigationTitle("Add an item")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed() {
        if textIsValid() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new totdo item must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func  getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                        .previewDisplayName("iPhone 12 Pro")
            
            
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                        .previewDisplayName("iPhone 12 Pro")
            
        }
    }
}
