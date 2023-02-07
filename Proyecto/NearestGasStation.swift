//
//  NearestGasStation.swift
//  Proyecto-iOS
//
//  Created by Derek Cortez Ibarra on 03/02/23.
//

import CoreLocation


class NearestGasStation {
    static func getTopFiveNearestStations(stations: [GasStation], actualLocation: CLLocation) -> [GasStation] {
        let distances = stations.map {
            gasolineraDistancia(distancia: calcularDistancia(origen: actualLocation, destino: $0.location), gasolinera: $0)
        }
        let sortedDistances = distances.sorted()
        let firstFive = sortedDistances.prefix(5)
        let onlyGasStations = firstFive.map { $0.gasolinera }
        return onlyGasStations
    }

    static func calcularDistancia(origen: CLLocation, destino: CLLocation) -> Double {
        let distancia =  origen.distance(from: destino)
        return distancia
        
    }
}



struct gasStation {
    let location: CLLocation
}

struct gasolineraDistancia: Comparable {
    let distancia: Double
    let gasolinera: GasStation

    static func < (lhs: gasolineraDistancia, rhs: gasolineraDistancia) -> Bool {
        return lhs.distancia < rhs.distancia
    }
}
extension gasolineraDistancia: Equatable {
    static func == (lhs: gasolineraDistancia, rhs: gasolineraDistancia) -> Bool {
        return lhs.distancia == rhs.distancia
    }
}
