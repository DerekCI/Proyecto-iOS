import SwiftUI
import MapKit
import UIKit


struct GasStation: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}
extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}

struct MapView: View {
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        
        
        let coordenadas = CLLocationCoordinate2D(latitude: locationViewModel.userLocation.center.latitude, longitude: locationViewModel.userLocation.center.longitude)
        
        let gasolineras = NearestGasStation.getTopFiveNearestStations(
            stations: getGasStations(), actualLocation: coordenadas)
        
        let annotations = [
            gasolineras[0].location,
            gasolineras[1].location,
            gasolineras[2].location,
            gasolineras[3].location,
            gasolineras[4].location,
        ]
        
        
        
        ZStack(alignment: .topTrailing ){
            
            Map(coordinateRegion: $locationViewModel.userLocation, showsUserLocation: true)
                .ignoresSafeArea()
            
            
            //Map(coordinateRegion: $locationViewModel.userLocation, annotationItems: annotations) {_ in

              //      }
            
                
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


