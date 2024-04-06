//
//  RawNavigationData.swift
//  ExtasyCompleteNavigation
//
//  Created by Vasil Borisov on 14.09.23.
//

import SwiftUI

struct RawNavigationData: View {
    
    @Environment (NMEAReader.self) private var navigationReadings
    
    var body: some View {
        
        //in next update I think there will be no restriction for the 10 lines
        VStack{
            //Data from instruments
            List{
                Text("Navigation data from Instruments")
                    .font(.title)
                Group{
                    //Text("Depth: \(navigationReadings.depth)")
                    //Text("Magnetic heading:" + (String(navigationReadings.magneticHeading)))
                   // Text("Total Distance Travelled: \(navigationReadings.totalDistance)")
                    //Text("Distance Since Last Reset: \(navigationReadings.distSinceReset)")
                    //Text("Sea Water Temperature: \(navigationReadings.seaWaterTemperature)")
                    //Text("Boat Speed: \(navigationReadings.boatSpeedLag)")
                    //Text("Apparent Wind Angle: \(navigationReadings.appWindAngle)")
                    //Text("Apparent Wind Speed: \(navigationReadings.appWindForce)")
//                    Text("True Wind Angle: \(navigationReadings.trueWindAngle)")
//                    Text("TrueWind Speed: \(navigationReadings.trueWindForce)")
                }
                .font(.subheadline)

                Text("GPS Data")
                    .font(.title)
                Group{
//                    Text("Time UTC: \(navigationReadings.utcTime)")
//                    Text("Date: \(navigationReadings.gpsDate)")
//                    Text("Latitude: \(navigationReadings.lat)")
//                    Text("Longtitude: \(navigationReadings.lon)")
//                    Text("Course Over Ground: \(navigationReadings.courseOverGround)")
//                    Text("Speed Over Ground: \(navigationReadings.speedOverGround)")
//                    Text("Polar Speed (pSPD): \(navigationReadings.polarSpeed)")
//                    Text("Polar VMG: \(navigationReadings.polarVMG)")
//                    Text("Current VMC: \(navigationReadings.waypointVMC)")

                }
                .font(.subheadline)

            }
        }//END OF VSTACK
        .navigationTitle("Raw Navigation Data")
        
    }//END OF BODY
}//END OF STRUCT

struct RawNavigationData_Previews: PreviewProvider {
    static var previews: some View {
        RawNavigationData()
    }
}
