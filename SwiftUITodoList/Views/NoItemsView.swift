//
//  NoItemsView.swift
//  SwiftUITodoList
//
//  Created by Eric Mok on 16/11/2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There is no item!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Click the button below to add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView(),
                               label: {
                                    Text("Add Something🥳")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .frame(height: 55)
                                        .frame(maxWidth: .infinity)
                                        .background(animate ? secondaryAccentColor : Color.accentColor)
                                        .cornerRadius(10)
                })
                .padding(.horizontal,  animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0.0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0) // move up and down
            }
            .frame(maxWidth: 400) // For Landscape mode
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return } // Just animate if there is no animation going on
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
        
    }
}
