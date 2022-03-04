//
//  ForEachTest.swift
//  Landmarks
//
//  Created by user on 10/20/21.
//

import SwiftUI

struct Ocean : Identifiable {
    var color: String
    var id = UUID()
}

var oceans = [
    Ocean(color: "blue"),
    Ocean(color: "white"),
    Ocean(color: "red")
]

struct ForEachTest: View {
    var textList = ["aaa", "bbb", "ccc"]
    var body: some View {
        VStack{
            ForEach(oceans) { ocean in
                Text(ocean.color)
            }
            ZStack {
                Ellipse().fill(.red)
                Ellipse().fill(.yellow).scaleEffect(0.9)
                Circle().fill(.orange).scaleEffect(0.8)
                Circle().fill(.red).scaleEffect(0.6)
            }
            .aspectRatio(0.8, contentMode: .fit)
            .frame(width: 300, height: 300)
        }
    }
}

struct ForEachTest_Previews: PreviewProvider {
    static var previews: some View {
        ForEachTest()
    }
}
