//
//  ContentView.swift
//  GraphCapsuleTest
//
//  Created by user on 10/28/21.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction:0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

struct HikeGraph: View {
    let hike: Hike
    let path: KeyPath<Hike.Observation,Range<Double>>

    var color: Color {
        switch path {
        case \.elevation:
            return .gray
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        default:
            return .brown
        }
    }

    var body: some View {
        let data = hike.observations
        let overallRange = rangeOfRanges(data.map { $0[keyPath: path] })
        let maxMagnitude = data.map { magnitude($0[keyPath: path]) }.max()!
        let heightRatio = 1 - maxMagnitude / magnitude(overallRange)
        
        return GeometryReader { geo in
            HStack(alignment: .bottom, spacing: geo.size.width / 100) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
                    GraphCapsule(
                        index: index,
                        height: geo.size.height,
                        range: observation[keyPath: path],
                        overallRange: overallRange)
                            .colorMultiply(color)
                            .transition(.slide)
                            .animation(.ripple(index: index))
                }
                .offset(x: 0, y: geo.size.height * heightRatio)
            }
        }
    }
}

struct HikeGraph_Previews: PreviewProvider {
    static let hikes = ModelData().hikes
    static var previews: some View {
        Group {
            HikeGraph(hike: hikes[0], path: \.elevation)
                .frame(height: 200)
            HikeGraph(hike: hikes[0], path: \.heartRate)
                .frame(height: 200)
            HikeGraph(hike: hikes[0], path: \.pace)
                .frame(height: 200)
        }
    }
}


