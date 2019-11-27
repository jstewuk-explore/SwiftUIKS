//
//  ContentView.swift
//  Numbers
//
//  Created by James Stewart on 11/26/19.
//  Copyright © 2019 James Stewart. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = 2.0
    
    var body: some View {
        VStack {
            ValueView(value: value)
            ValueSlider(value: $value)
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
