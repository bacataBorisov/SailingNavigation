//
//  Anemometer.swift
//  ExtasyCompleteNavigation
//
//  Created by Vasil Borisov on 15.08.23.
//
// all the structures and computed variables are after the view, at the bottom of the file

import SwiftUI

struct AnemometerView: View {
    
    var trueWindAngle = Double()
    var trueWindSpeed = Double()
    var windAngle = Double()
    var windSpeed = Double()
    
    
    
    var body: some View {
        
        ZStack {
            
            GeometryReader{ geometry in
                
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                
                //gauge dial
                Circle()
                    .fill(Color("display_background"))
                    .shadow(radius: 10, x: -10, y: 10)
                //STBD color
                Circle()
                    .trim(from: 0, to: 0.167)
                    .stroke(Color(UIColor.systemGreen), lineWidth: width/20)
                    .padding((width/20)/2) //it gives half of the stroke width, so it is like a strokeBorder
                    .rotationEffect(.init(degrees: 270))
                
                //PORT color
                Circle()
                    .trim(from: 0, to: 0.167)
                    .stroke(Color(UIColor.systemRed), lineWidth: width/20)
                    .padding((width/20)/2)
                    .rotationEffect(.init(degrees: 210))

                
                //angle indicators
                //long indicators
                MyShape(sections: 12, lineLengthPercentage: 0.15)
                    .stroke(Color("display_font"), style: StrokeStyle(lineWidth: width/90))
                //short indicators
                MyShape(sections: 36, lineLengthPercentage: 0.05)
                    .stroke(Color("display_font"), style: StrokeStyle(lineWidth: width/90))
                //.scaleEffect(x: 0.95, y: 0.95)
                // gauge numbers <--- here
                ForEach(GaugeMarker.labelSet()) { marker in
                    LabelView(marker: marker,  geometry: geometry)
                        .position(CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
                }

                //wind speed value and measurment units - this has to be tweaked in the future and to switch between m/s and knots
                Circle()
                    .stroke(Color("display_background"), lineWidth: width/100)
                VStack(alignment: .center){
                    Group{
                        Text("\(windSpeed, specifier: "%.1f")")
                            .font(Font.custom("AppleSDGothicNeo-Bold", size: geometry.size.width/9))
                            .foregroundColor(Color("display_font"))
                        
                        Text("\(trueWindSpeed, specifier: "%.1f")")
                            .foregroundColor(Color(UIColor.systemCyan))
                            .font(Font.custom("AppleSDGothicNeo-Bold", size: geometry.size.width/9))
                            .foregroundColor(.white)
                        
                        Text("knots")
                            .font(Font.custom("AppleSDGothicNeo-Bold", size: geometry.size.width/16))
                            .foregroundColor(Color(UIColor.systemGray))
                        
                    }
                    .frame(maxWidth: .infinity) //positions the center of the view in the center horizontally
                    .offset(y: geometry.size.width/1.9) // offset by y to get it down
                    
                }

                PseudoBoat()
                    .stroke(lineWidth: 4)
                    .foregroundColor(Color("display_font"))
                    .scaleEffect(x: 0.30, y: 0.66, anchor: .top)
                    .offset(y: geometry.size.height/5)
                
                Group{
                    
                    //part of the indicator
                    Circle()
                        .fill(.white)
                        .scaleEffect(x: 0.04, y: 0.04, anchor: .center)
                    //indicator arrow - apparent wind direction
                    Triangle()
                        .fill(Color("display_font"))
                        .scaleEffect(x: 0.04, y: 0.5, anchor: .top)
                        .rotationEffect(.init(degrees: windAngle))
                        .animation(Animation.easeInOut(duration: 1), value: windAngle)
                    //part of the indicator
                    Circle()
                        .fill(Color(UIColor.systemCyan))
                        .scaleEffect(x: 0.04, y: 0.04, anchor: .center)
                    
                    //indicator arrow - true wind direction
                    Triangle()
                        .fill(Color(UIColor.systemCyan))
                        .scaleEffect(x: 0.04, y: 0.5, anchor: .top)
                        .rotationEffect(.init(degrees: trueWindAngle))
                        .animation(Animation.easeInOut(duration: 1), value: trueWindAngle)
                }
                
            }
            //that centers the shape
            .aspectRatio(1, contentMode: .fit)
        }
    }
}


#Preview(){
    AnemometerView()
}
