//
//  ContentView.swift
//  SwiftUIKS
//
//  Created by James Stewart on 11/13/19.
//  Copyright © 2019 James Stewart. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
        .padding()
        .background(Color.orange)
        
        .font(.largeTitle)
        .padding()
        .background(Color.blue)
        
        .foregroundColor(.secondary)
        .padding()
        .background(Color.green)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
