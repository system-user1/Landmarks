/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a hike.
*/

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation
    
    var body: some View {
        let buttons = [
            ("Elevation", \Hike.Observation.elevation),
            ("Heart Rate", \Hike.Observation.heartRate),
            ("Pace", \Hike.Observation.pace)
        ]

        VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)
            HStack(spacing: 20) {
                ForEach(buttons, id: \.1) { button in
                    Button(action: {
                        self.dataToShow = button.1
                    }, label: {
                        Text(button.0)
                            .font(.system(size: 15))
                            .foregroundColor(self.dataToShow == button.1 ? .gray : .accentColor)
                            
                    })
                }
            }
            
        }
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: ModelData().hikes[0])
    }
}
