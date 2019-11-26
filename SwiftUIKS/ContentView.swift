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
        CheckerBoard {
            Rectangle().foregroundColor(.red)
            Rectangle().foregroundColor(.black)
        }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
