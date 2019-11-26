//
//  CheckerBoard.swift
//  SwiftUIKS
//
//  Created by James Stewart on 11/26/19.
//  Copyright © 2019 James Stewart. All rights reserved.
//

import SwiftUI

struct CheckerBoard<A, B>: View where A: View, B: View {
    let firstView: A
    let secondView: B
    
    var body: some View {
        VStack {
            HStack {
                firstView
                secondView
            }
            HStack {
                secondView
                firstView
            }
        }
    }
    
    init(@CheckerBoardBuilder builder: () -> (A, B)) {
        (firstView, secondView) = builder()
    }
}

@_functionBuilder
struct CheckerBoardBuilder {
    static func buildBlock<A: View, B: View>(_ firstView: A, _ secondView: B) -> (A, B) {
        (firstView, secondView)
    }
}

struct CheckerBoard_Previews: PreviewProvider {
    static var previews: some View {
        CheckerBoard {
            Text("foo de foo")
            Text("bar de bar")
        }
    }
}
