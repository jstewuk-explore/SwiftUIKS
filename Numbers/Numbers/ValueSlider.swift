//
//  ValueSlider.swift
//  Numbers
//
//  Created by James Stewart on 11/26/19.
//  Copyright © 2019 James Stewart. All rights reserved.
//

import SwiftUI

struct ValueSlider: View {
    @Binding var value: Double
    
    var body: some View {
        Slider(value: $value,
               in: 0.0 ... 4.0,
               step:0.0001)
    }
}

struct ValueSlider_Previews: PreviewProvider {
    static var previews: some View {
        ValueSlider(value: .constant(10.0))
    }
}
