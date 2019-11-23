//
//  ContentView.swift
//  SwiftUIKS
//
//  Created by James Stewart on 11/13/19.
//  Copyright © 2019 James Stewart. All rights reserved.
//

import SwiftUI

class ShowingSheet: ObservableObject {
    @Published var value = false
}

struct ContentView: View {
    @ObservedObject var newShowingSheet = ShowingSheet()
    var body: some View {
        ZStack {
            VStack {
                Text("Hello, World!")
                Button(action: { self.newShowingSheet.value.toggle() }) {
                    Text("Show Sheet")
                }
                Text("showingSheet: \(self.newShowingSheet.value ? "true": "false")")
            }.sheet(isPresented: $newShowingSheet.value) {
                DaSheet(showingSheet: self.newShowingSheet)
            }
            FloatingButton(showingSheet: self.newShowingSheet)
        }
    }
}

struct FloatingButton: View {
    @ObservedObject var showingSheet: ShowingSheet
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.showingSheet.value.toggle()
                }, label: {
                    Text("+")
                        .font(.system(.largeTitle))
                        .frame(width: 77, height: 70)
                        .foregroundColor(.white)
                        .padding(.bottom, 7)
                        .background(Color.blue)
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                })
            }
        }
    }
}

struct DaSheet: View {
    @ObservedObject var showingSheet: ShowingSheet
    
    var body: some View {
        VStack {
            Text("Da sheet -- showingSheet: \(self.showingSheet.value ? "true" : "false")")
            Button(action: { self.showingSheet.value.toggle() }) {
                Text("Hide Sheet")
            }
        }
    }
}

struct Item {
    let uuid = UUID()
    let value: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
