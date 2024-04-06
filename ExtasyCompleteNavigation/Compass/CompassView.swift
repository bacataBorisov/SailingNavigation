//
//  CompassView.swift
//  ExtasyCompleteNavigation
//
//  Created by Vasil Borisov on 20.08.23.
//

import SwiftUI
import Foundation

struct CompassView: View {
    
    var heading = Double()
    
    var body: some View {
        
        VStack{
            ZStack{
                GeometryReader{ geometry in
                    
                    let width: CGFloat = min(geometry.size.width, geometry.size.height)
                    //compass degree ring
                    
                    Group{
                        MyShape(sections: 12, lineLengthPercentage: 0.15)
                            .stroke(Color("display_font"), style: StrokeStyle(lineWidth: width/55))
                        
                        MyShape(sections: 180, lineLengthPercentage: 0.15)
                            .stroke(Color("display_font"), style: StrokeStyle(lineWidth: width/200))
                    }
                    .scaleEffect(x: 1, y:1)
                    
                    //heading values
                    ForEach(GaugeMarkerCompass.labelSet()) { marker in
                        CompassLabelView(marker: marker,  geometry: geometry)
                            .position(CGPoint(x: width / 2, y: width / 2))
                        
                        
                    }
                }
            }.aspectRatio(1, contentMode: .fit)
        }.transaction { transaction in
            transaction.animation = nil
        }
        //rotate only the second Vstack
        .rotationEffect(Angle(degrees: -Double(heading)))  // why it has to be minus? is it a bug?
        .animation(.easeInOut(duration: 2), value: heading)// <--- here
        
    }
}

#Preview {
    CompassView(heading: 0)
        .background(Color("display_background"))
}


