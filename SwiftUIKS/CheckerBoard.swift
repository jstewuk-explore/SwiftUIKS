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
    let stackColor: Color
    
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
        }.background(stackColor)
    }
    
    init(backgroundColor: Color = .white, @CheckerBoardBuilder builder: () -> (A, B)) {
        stackColor = backgroundColor
        (firstView, secondView) = builder()
    }
}

extension CheckerBoard where B == Rectangle {
    init(backgroundColor: Color = .white, @CheckerBoardBuilder builder: () -> (A)) {
        stackColor = backgroundColor
        firstView = builder()
        secondView = Rectangle()
    }
}

@_functionBuilder
struct CheckerBoardBuilder {
    static func buildBlock<A: View>(_ firstView: A) -> A {
        firstView
    }
    
    static func buildBlock<A: View, B: View>(_ firstView: A, _ secondView: B) -> (A, B) {
        (firstView, secondView)
    }
}

struct CheckerBoard_Previews: PreviewProvider {
    static var previews: some View {
        CheckerBoard(backgroundColor: .green) {
            Text("foo de foo")
            Text("bar de bar")
        }
//        CheckerBoard {
//            Text("foo de foo")
//        }
    }
}
