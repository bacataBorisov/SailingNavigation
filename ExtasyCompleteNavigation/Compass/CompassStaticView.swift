//
//  CompassStaticView.swift
//  ExtasyCompleteNavigation
//
//  Created by Vasil Borisov on 22.08.23.
//

import SwiftUI

struct CompassStaticView: View {
    
    var heading = Double()
    
    var body: some View {
        
        ZStack{
            
            GeometryReader{ geometry in
                
                let width = geometry.size.width
                //let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = geometry.size.height


                let fontSize = width/15
                //compass background
                
                Circle()
                    .stroke(Color("display_background"), lineWidth: 5)
                Circle()
                    .position(.init(x: width/2, y: height/2))
                    .foregroundColor(Color("display_background"))
                Circle()
                    .position(.init(x: width/2, y: height/2))
                    .foregroundColor(Color(UIColor.systemRed))
                    .scaleEffect(x: 0.02, y:0.02, anchor: .center)
                Text("▼")
                    .font(Font.custom("AppleSDGothicNeo-Bold", size: fontSize))
                    .position(x:width/2, y: height/2 )
                    .offset(y: -width/2.05)
                    .foregroundColor(.red)
                Text("\(heading.magnitude, specifier: "%.0f")°\(displayDirection())")
                    .font(Font.custom("AppleSDGothicNeo-Bold", size: fontSize ))
                    .foregroundColor(Color("display_font"))
                    .position(x: width/2, y:height/1.39)
                PseudoBoat()
                    .stroke(lineWidth: 4)
                    .foregroundColor(Color("display_font"))
                    .scaleEffect(x: 0.28, y: 0.58, anchor: .top)
                    .offset(y: geometry.size.height/5.5)
                
            }
            .aspectRatio(1, contentMode: .fit)
            .shadow(radius: 10, x: -10, y: 10)
            
        }
    }
    
    //function can be moved in a structure with the rest of the tools in swift file
    func displayDirection() -> String {
        
        //magnitute give you the absolute value
        switch heading.magnitude {
            
        case 22.5..<67.5:
            return "NE"
        case 67.5..<112.5:
            return "E"
        case 112.5..<157.5:
            return "SE"
        case 157.5..<202.5:
            return "S"
        case 202.5..<247.5:
            return "SW"
        case 247.5..<292.5:
            return "W"
        case 292.5..<337.5:
            return "NW"
        default:
            return "N"
        }
        
    }
}

#Preview {
    CompassStaticView(heading: 0)
}

