//
//  ValueView.swift
//  Numbers
//
//  Created by James Stewart on 11/26/19.
//  Copyright © 2019 James Stewart. All rights reserved.
//

import SwiftUI

struct ValueView: View {
    @RoundedTo(1) var value: Double
    
    init(value: Double) {
        self.value = value
    }
    
    var body: some View {
        Text(value.description)
    }
}

struct ValueView_Previews: PreviewProvider {
    static var previews: some View {
        ValueView(value: 2)
    
    }
}
