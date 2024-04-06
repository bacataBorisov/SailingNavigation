//
//  WaypointDetailedView.swift
//  ExtasyCompleteNavigation
//
//  Created by Vasil Borisov on 18.01.24.
//

import SwiftUI
import SwiftData
import MapKit


struct WaypointDetailedView: View {
    
    
    @Environment(NMEAReader.self) private var navigationReadings
    
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var waypoint: Waypoints
    
    //@Environment(\.modelContext) private var modelContext
    
    @Namespace var mapScope
    
    var body: some View {
        NavigationStack{
            //This function is declared PUBLIC in PublicTools
            VHStack{
                List{
                    TextField("Waypoint Name", text: $waypoint.title)
                    TextField("Latitude", value: $waypoint.lat, format: .number)
                    TextField("Longitude", value: $waypoint.lon, format: .number)
                    //something with check box - "Show on Map" - to be show on the map but without being VMG target
                    Button("Set as VMG Target") {
                        waypoint.isTargetSelected = true // used to be shown on the map
                        
                        //print("Setting VMG target ...")
                        
                        if  let lat = waypoint.lat,
                            let lon = waypoint.lon
                        {
                            navigationReadings.markerCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                            navigationReadings.isVMGSelected = true // start calculating VMG
                            print("VMG TArget SET!!!")
                        }
                    }
                    Button("Cancel VMG"){
                        waypoint.isTargetSelected = false // hide the mark on the map
                        navigationReadings.isVMGSelected = false // stop calculating VMG
                    }
                    
                }//END OF LIST
            }
        }
        .navigationTitle(waypoint.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
        }
    }
}

#Preview {
    NavigationStack {
        WaypointDetailedView(waypoint: Waypoints())
            .modelContainer(for: Waypoints.self)
            .environment(NMEAReader())
    }
}
