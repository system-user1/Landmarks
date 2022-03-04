/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
//        .move(edge: .trailing)
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return AnyTransition.asymmetric(insertion: insertion, removal: removal)
    }
}


struct HikeView: View {
    var hike: Hike
    @State var showDetail: Bool = false
    
    var body: some View {
        let path: KeyPath<Hike.Observation, Range<Double>> = \.elevation
        
        VStack {
            HStack {
                HikeGraph(hike: hike, path: path)
                    .frame(width: 50, height: 30)
                VStack {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(self.showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
//                        .animation(nil)
                        .padding()
                }
            }
            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var hike = ModelData().hikes[0]
    static var previews: some View {
        VStack {
            HikeView(hike: hike)
                .padding()
            Spacer()
        }
    }
}


