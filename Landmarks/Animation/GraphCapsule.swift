//
//  GraphCapsule.swift
//  GraphCapsuleTest
//
//  Created by user on 10/28/21.
//

import SwiftUI

struct GraphCapsule: View {
    let index: Int
    let height: CGFloat
    let range: Range<Double>
    let overallRange: Range<Double>

    var heightRatio: CGFloat {
        max(magnitude(range) / magnitude(overallRange), 0.15)
    }
    
    var offsetRatio: CGFloat {
        (overallRange.lowerBound - range.lowerBound) / magnitude(overallRange)
    }
    
    var body: some View {
//        GeometryReader { geo in
            Capsule()
                .fill(.white)
                .frame(height: height * heightRatio)
                .offset(x: 0, y: height * offsetRatio)
//        }
    }
}

struct Capsule_Previews: PreviewProvider {
    static var previews: some View {
        GraphCapsule(index: 0, height: 100, range: 20..<60, overallRange: 0..<100)
            .colorMultiply(.blue)
    }
}


func rangeOfRanges<C: Collection>(_ ranges: C) -> C.Element
    where C.Element == Range<Double>
{
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0[keyPath: \.lowerBound] }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

func magnitude<T>(_ range: Range<T>) -> T
    where T: Numeric
{
    return range.upperBound - range.lowerBound
}

