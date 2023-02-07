import SwiftUI
import MapKit
import UIKit

struct MapView: View {
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        let gasStation = GasStation.self
        let coordenadas = CLLocationCoordinate2D(latitude: locationViewModel.userLocation.center.latitude, longitude: locationViewModel.userLocation.center.longitude)
        
        let gasolineras = NearestGasStation.getTopFiveNearestStations(
            stations: getGasStations(), actualLocation: coordenadas)
        
        ZStack(alignment: .topTrailing ){
            
            Map(coordinateRegion: $locationViewModel.userLocation, showsUserLocation: true)
                .ignoresSafeArea()
            
            
        
            
                
            Button(action: {
                self.showProfileView()
            }) {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color("SecondaryColor"))//color primario
            .foregroundColor(.white)
            .cornerRadius(.infinity)
            .padding()
        }//zstack
        
        
    }//body

    func showProfileView() {
        let profileView = ProfileView()
        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: profileView)
    }
}


