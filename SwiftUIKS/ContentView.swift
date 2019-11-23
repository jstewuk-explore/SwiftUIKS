//
//  ContentView.swift
//  SwiftUIKS
//
//  Created by James Stewart on 11/13/19.
//  Copyright © 2019 James Stewart. All rights reserved.
//

import SwiftUI

class BoundBool: ObservableObject {
    @Published var value = false
}

class Position: ObservableObject {
    @Published var value = CGSize.zero
}

struct ContentView: View {
    @ObservedObject var newShowingSheet = BoundBool()
    
    @ObservedObject var currentPosition = Position()
    @ObservedObject var newPosition = Position()
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
            DraggableCircle(currentPosition: currentPosition, newPosition:  newPosition, bgColor: .red)
        }
    }
}

struct FloatingButton: View {
    @ObservedObject var showingSheet: BoundBool
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

struct DraggableCircle: View {
    @ObservedObject var currentPosition: Position
    @ObservedObject var newPosition: Position
    
    let bgColor: Color
    
    var body: some View {
        Circle(bgColor: bgColor)
            .offset(x: self.currentPosition.value.width, y: self.currentPosition.value.height)
            .gesture(DragGesture()
                .onChanged { value in
                    self.currentPosition.value = CGSize(width: value.translation.width + self.newPosition.value.width, height: value.translation.height + self.newPosition.value.height)
                }
                .onEnded { value in
                    self.currentPosition.value = CGSize(width: value.translation.width + self.newPosition.value.width, height: value.translation.height + self.newPosition.value.height)
                    print(self.newPosition.value.width)
                    self.newPosition.value = self.currentPosition.value
                }
        )
    }
}

struct Circle: View {
    let bgColor: Color
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("*")
                .font(.system(.largeTitle))
                .frame(width: 77, height: 70)
                .foregroundColor(.white)
                .padding(.bottom, 7)
                .background(bgColor)
                .cornerRadius(38.5)
                .padding()
                .shadow(color: Color.black.opacity(0.3),
                        radius: 3,
                        x: 3,
                        y: 3)
                Spacer()
            }
            Spacer()
        }
    }
}

struct DaSheet: View {
    @ObservedObject var showingSheet: BoundBool
    
    var body: some View {
        VStack {
            Text("Da sheet -- showingSheet: \(self.showingSheet.value ? "true" : "false")")
            Button(action: { self.showingSheet.value.toggle() }) {
                Text("Hide Sheet")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
