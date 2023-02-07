//
//  NearestGasStation.swift
//  Proyecto-iOS
//
//  Created by Derek Cortez Ibarra on 03/02/23.
//

import CoreLocation
import MapKit


class NearestGasStation {
    static func getTopFiveNearestStations(stations: [GasStation], actualLocation: CLLocationCoordinate2D) -> [GasStation] {
        
        let distances = stations.map {
            gasolineraDistancia(distancia: calcularDistancia(origen: actualLocation, destino: $0.location), gasolinera: $0)
        }
        let sortedDistances = distances.sorted()
        let firstFive = sortedDistances.prefix(5)
        let onlyGasStations = firstFive.map { $0.gasolinera }
        return onlyGasStations
    }
    
    static func calcularDistancia(origen: CLLocationCoordinate2D, destino: CLLocationCoordinate2D) -> Double {
        let point1 = MKMapPoint(origen)
        let point2 = MKMapPoint(destino)
        
        let distance = point1.distance(to: point2)/1000
        return distance
        
    }
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

func getGasStations() -> [GasStation] {
    var gasStations: [GasStation] = []
    
    gasStations.append(GasStation(lat: 19.3969941, long:  -99.0992573))
    gasStations.append(GasStation(lat: 19.40909602, long:  -99.16767659))
    gasStations.append(GasStation(lat: 19.45998011, long:  -99.18692055))
    gasStations.append(GasStation(lat: 19.37928112, long:  -99.18813010))
    gasStations.append(GasStation(lat: 19.45229044, long:  -99.14591838))
    gasStations.append(GasStation(lat: 19.41289732, long:  -99.16110616))
    gasStations.append(GasStation(lat: 19.45617586, long:  -99.12876571))
    gasStations.append(GasStation(lat: 19.40147175, long:  -99.17567329))
    gasStations.append(GasStation(lat: 19.39231397, long:  -99.16577711))
    gasStations.append(GasStation(lat: 19.42003549, long:  -99.17647583))
    gasStations.append(GasStation(lat: 19.42270362, long:  -99.16108749))
    gasStations.append(GasStation(lat: 19.41572357, long:  -99.15459188))
    gasStations.append(GasStation(lat: 19.48513199, long:  -99.11893961))
    gasStations.append(GasStation(lat: 19.34754787, long:  -99.18766420))
    gasStations.append(GasStation(lat: 19.42222093, long:  -99.20733727))
    gasStations.append(GasStation(lat: 19.38846714, long:  -99.13276130))
    gasStations.append(GasStation(lat: 19.39747485, long:  -99.16727402))
    
    gasStations.append(GasStation(lat: 19.4153454    ,long: -99.16564411
                                     ))
    gasStations.append(GasStation(lat: 9.40334813,    long: -99.18325998))
    gasStations.append(GasStation(lat: 19.40097757,    long: -99.1702492
                                     ))
    gasStations.append(GasStation(lat: 19.47479    ,long: -99.12130259
                                     ))
    gasStations.append(GasStation(lat: 19.43172578,    long: -99.15952346))
    gasStations.append(GasStation(lat: 19.42762623,    long: -99.11993405))
    gasStations.append(GasStation(lat: 19.3995131    ,long: -99.17034631
                                     ))
    gasStations.append(GasStation(lat: 19.45435927,    long: -99.18772576))
    gasStations.append(GasStation(lat: 19.45800632,    long: -99.20019562))
    gasStations.append(GasStation(lat: 19.38846747,    long: -99.13857586))
    gasStations.append(GasStation(lat: 19.4161668    ,long: -99.18233724
                                     ))
    gasStations.append(GasStation(lat: 19.49493369,    long: -99.13252805))
    gasStations.append(GasStation(lat: 19.44553434,    long: -99.20177218))
    gasStations.append(GasStation(lat: 19.42845249,    long: -99.15526512))
    gasStations.append(GasStation(lat: 19.43857776,    long: -99.16793218))
    gasStations.append(GasStation(lat: 19.39008535,    long: -99.20519237))
    gasStations.append(GasStation(lat: 19.40169303,    long: -99.12519614))
    gasStations.append(GasStation(lat: 19.39423825,    long: -99.13851627))
    gasStations.append(GasStation(lat: 19.48780405,    long: -99.151148
                                     ))
    gasStations.append(GasStation(lat: 19.42749369,    long: -99.13920406))
    gasStations.append(GasStation(lat: 19.42378793,    long: -99.15291003))
    gasStations.append(GasStation(lat: 19.39746642,    long: -99.15077554))
    gasStations.append(GasStation(lat: 19.30435114,    long: -99.06007263))
    gasStations.append(GasStation(lat: 19.46705459,    long: -99.12434662))
    gasStations.append(GasStation(lat: 19.35724067,    long:-98.99404275))
    gasStations.append(GasStation(lat: 19.44649298,    long: -99.13881776))
    gasStations.append(GasStation(lat: 19.3602713    ,long: -99.17155062
                                     ))
    gasStations.append(GasStation(lat: 1.31377768,    long: -99.12428277))
    gasStations.append(GasStation(lat: 19.3727963    ,long: -99.09931964
                                     ))
    gasStations.append(GasStation(lat: 19.36761145,    long: -99.14226622))
    gasStations.append(GasStation(lat: 19.34631758,    long: -99.0195258
                                     ))
    gasStations.append(GasStation(lat: 19.43833251,    long: -99.11910947))
    gasStations.append(GasStation(lat: 19.41563626,    long: -99.17007402))
    gasStations.append(GasStation(lat: 19.45135138,    long: -99.16185902))
    gasStations.append(GasStation(lat: 19.40207856,    long: -99.14473189))
    gasStations.append(GasStation(lat: 19.34315757,    long: -99.03935062))
    gasStations.append(GasStation(lat: 19.5607276    ,long: -99.13403002
                                     ))
    gasStations.append(GasStation(lat: 19.33894    ,long: -99.12748
                                     ))
    gasStations.append(GasStation(lat: 19.3838602    ,long: -99.16396139))
    gasStations.append(GasStation(lat: 19.26781949,    long: -99.11618013))
    gasStations.append(GasStation(lat: 19.44134224,    long: -99.20975331))
    gasStations.append(GasStation(lat: 19.40162472,    long: -99.1365534
                                     ))
    gasStations.append(GasStation(lat: 19.3607472    ,long: -99.18901809
                                     ))
    gasStations.append(GasStation(lat: 19.42710106,    long: -99.13927874))
    gasStations.append(GasStation(lat: 19.37228541,    long: -99.17283809))
    gasStations.append(GasStation(lat: 19.44978592,    long: -99.16405646))
    gasStations.append(GasStation(lat: 19.35065125,    long: -99.16389843))
    gasStations.append(GasStation(lat: 19.34564743,    long: -99.02015237))
    gasStations.append(GasStation(lat: 19.41016009,    long: -99.08042543))
    gasStations.append(GasStation(lat: 19.43611784,    long: -99.18194897))
    gasStations.append(GasStation(lat: 19.43730916,    long: -99.16512432))
    gasStations.append(GasStation(lat: 19.43595964,    long: -99.1817747
                                     ))
    gasStations.append(GasStation(lat: 19.45814765,    long: -99.11798947))
    gasStations.append(GasStation(lat: 19.45812129,    long: -99.1179078
                                     ))
    gasStations.append(GasStation(lat: 19.46677653,    long: -99.14206349))
    gasStations.append(GasStation(lat: 19.43609474,    long: -99.18192352))
    gasStations.append(GasStation(lat: 19.37234654,    long: -99.09935529))
    gasStations.append(GasStation(lat: 19.43595964,    long: -99.1817747
                                     ))
    gasStations.append(GasStation(lat: 19.42394398,    long: -99.16691452))
    gasStations.append(GasStation(lat: 19.44093329,    long: -99.21013573))
    gasStations.append(GasStation(lat: 19.45279716,    long: -99.21851006))
    gasStations.append(GasStation(lat: 19.43675397,    long: -99.21015502))
    gasStations.append(GasStation(lat: 19.43756733,    long: -99.17678472))
    gasStations.append(GasStation(lat: 19.42630151,    long: -99.17057313))
    gasStations.append(GasStation(lat: 19.37259086,    long: -99.09941398))
    gasStations.append(GasStation(lat: 19.39727321,    long: -99.05829117))
    gasStations.append(GasStation(lat: 19.34767345,    long: -99.1904719
                                     ))
    gasStations.append(GasStation(lat: 19.52265381,    long: -99.14220597))
    gasStations.append(GasStation(lat: 19.52102075,    long: -99.14214408))
    gasStations.append(GasStation(lat: 19.43647738,    long: -99.19966747))
    gasStations.append(GasStation(lat: 19.39857351,    long: -99.07787346))
    gasStations.append(GasStation(lat: 19.4069206    ,long: -99.20091791
                                     ))
    gasStations.append(GasStation(lat: 19.42848989,    long: -99.09172351))
    gasStations.append(GasStation(lat: 19.39240015,    long: -99.04942426))
    gasStations.append(GasStation(lat: 19.4632448    ,long: -99.05682851
                                     ))
    gasStations.append(GasStation(lat: 19.53120381,    long: -99.14190485))
    gasStations.append(GasStation(lat: 19.46218435,    long: -99.17785188))
    gasStations.append(GasStation(lat: 19.44486021,    long: -99.13504696))
    gasStations.append(GasStation(lat: 19.29288277,    long: -99.21658526))
    gasStations.append(GasStation(lat: 19.37324848,    long: -99.04016997))
    gasStations.append(GasStation(lat: 19.34663511,    long: -99.20234096))
    gasStations.append(GasStation(lat: 19.4565807    ,long: -99.13783016
                                     ))
    gasStations.append(GasStation(lat: 19.29774743,    long: -99.15173376))
    gasStations.append(GasStation(lat: 19.33710366,    long: -99.18444418))
    gasStations.append(GasStation(lat: 19.30169072,    long: -99.16741692))
    gasStations.append(GasStation(lat: 19.36971472,    long: -99.18007953))
    gasStations.append(GasStation(lat: 19.47494212,    long: -99.1394881))
    gasStations.append(GasStation(lat: 19.40704372,    long: -99.13612739))
    gasStations.append(GasStation(lat: 19.50223284,    long: -99.1493369))
    gasStations.append(GasStation(lat: 19.49097457,    long: -99.17333015))
    gasStations.append(GasStation(lat: 19.41794694,    long: -99.17466649))
    gasStations.append(GasStation(lat: 19.48201746,    long: -99.18753005))
    gasStations.append(GasStation(lat: 19.47126824,    long: -99.16597835))
    gasStations.append(GasStation(lat: 19.36981042,    long: -99.13732211))
    gasStations.append(GasStation(lat: 19.45778825,    long: -99.15123312))
    gasStations.append(GasStation(lat: 19.35274111,    long: -99.0145848))
    gasStations.append(GasStation(lat: 19.36220597,    long: -99.15719496))
    gasStations.append(GasStation(lat: 19.31595769,    long: -99.1249071))
    gasStations.append(GasStation(lat: 19.39434637,    long: -99.14134037))
    gasStations.append(GasStation(lat: 19.30848271,    long: -99.13352682))
    gasStations.append(GasStation(lat: 19.45416495,    long: -99.21681985))
    gasStations.append(GasStation(lat: 19.33350197,    long: -99.20113079))
    gasStations.append(GasStation(lat: 19.38044642,    long: -99.25186886))
    gasStations.append(GasStation(lat: 19.30541073,    long: -99.06314589))
    gasStations.append(GasStation(lat: 19.36058531,    long: -99.03525288))
    gasStations.append(GasStation(lat: 19.39497671,    long: -99.18092459))
    gasStations.append(GasStation(lat: 19.28317528,    long: -99.21713621))
    gasStations.append(GasStation(lat: 19.37866936,    long: -99.07707102))
    gasStations.append(GasStation(lat: 19.3876358    ,long: -99.26287544))
    gasStations.append(GasStation(lat: 19.22547577,    long: -99.2116633))
    gasStations.append(GasStation(lat: 19.37798236,    long: -99.08176304))
    gasStations.append(GasStation(lat: 19.25719692,    long: -99.02356714))
    gasStations.append(GasStation(lat: 19.39647829,    long: -99.16194863))
    gasStations.append(GasStation(lat: 19.42086205,    long: -99.1271033))
    gasStations.append(GasStation(lat: 19.28248239,    long: -99.14210903))
    gasStations.append(GasStation(lat: 19.39226995,    long: -99.20210672))
    gasStations.append(GasStation(lat: 19.2291238    ,long: -99.19699989
                                     ))
    gasStations.append(GasStation(lat: 19.41205631,    long: -99.15971371))
    gasStations.append(GasStation(lat: 19.4432716    ,long: -99.18317997
                                     ))
    gasStations.append(GasStation(lat: 19.35663223,    long: -99.09787205))
    gasStations.append(GasStation(lat: 19.37983826,    long: -99.08129668))
    gasStations.append(GasStation(lat: 19.38550381,    long: -99.22616726))
    gasStations.append(GasStation(lat: 19.25721995,    long: -99.01829804))
    gasStations.append(GasStation(lat: 19.35111469,    long: -99.21848313))
    gasStations.append(GasStation(lat: 19.423135    ,long: -99.12949737))
    gasStations.append(GasStation(lat: 19.44226012,    long: -99.08601109))
    gasStations.append(GasStation(lat: 19.4425418    ,long: -99.08597015))
    gasStations.append(GasStation(lat: 19.38355977,    long: -99.14530462))
    gasStations.append(GasStation(lat: 19.33681674,    long: -99.14246725))
    gasStations.append(GasStation(lat: 19.30283791,    long: -99.20701394))
    gasStations.append(GasStation(lat: 19.3277207    ,long: -99.21927721))
    gasStations.append(GasStation(lat: 19.48154471,    long: -99.16508627))
    gasStations.append(GasStation(lat: 19.37345007,    long: -99.01793282))
    gasStations.append(GasStation(lat: 19.4511672    ,long: -99.11569976))
    gasStations.append(GasStation(lat: 19.31686552,    long: -99.12741385))
    gasStations.append(GasStation(lat: 19.4552694    ,long: -99.16100498))
    gasStations.append(GasStation(lat: 19.40130877,    long: -99.16226381))
    gasStations.append(GasStation(lat: 19.49615781,    long: -99.15911236))
    gasStations.append(GasStation(lat: 19.38127593,    long: -99.11109193))
    gasStations.append(GasStation(lat: 19.36582638,    long: -99.09152234))
    gasStations.append(GasStation(lat: 19.3371588    ,long: -99.06454995))
    gasStations.append(GasStation(lat: 19.33830664,    long: -99.19282561))
    gasStations.append(GasStation(lat: 19.28136541,    long: -99.21491347))
    gasStations.append(GasStation(lat: 19.37614491,    long: -99.06219418))
    gasStations.append(GasStation(lat: 19.4098708    ,long: -99.07286874))
    gasStations.append(GasStation(lat: 19.38990397,    long: -99.20350603))
    gasStations.append(GasStation(lat: 19.39010596,    long: -99.20310057))
    gasStations.append(GasStation(lat: 19.51327834,    long: -99.14693838))
    gasStations.append(GasStation(lat: 19.51142806,    long: -99.14903083))
    gasStations.append(GasStation(lat: 19.49025315,    long: -99.0914286))
    gasStations.append(GasStation(lat: 19.36644254,    long: -99.23259481))
    gasStations.append(GasStation(lat: 19.42055    ,long: -99.13419895))
    gasStations.append(GasStation(lat: 19.44058705,    long: -99.0856939))
    gasStations.append(GasStation(lat: 19.30559396,    long: -99.20394364))
    gasStations.append(GasStation(lat: 19.50560509,    long: -99.19050737))
    gasStations.append(GasStation(lat: 19.39706753,    long: -99.07285479))
    gasStations.append(GasStation(lat: 19.49028129,    long: -99.1445814))
    gasStations.append(GasStation(lat: 19.43574198,    long: -99.1819921))
    gasStations.append(GasStation(lat: 19.43252149,    long: -99.21310157))
    gasStations.append(GasStation(lat: 19.4613431    ,long: -99.14068356))
    gasStations.append(GasStation(lat: 19.43610725,    long: -99.1819373))
    gasStations.append(GasStation(lat: 19.48800875,    long: -99.16265152))
    gasStations.append(GasStation(lat: 19.38345    ,long: -99.09287627))
    gasStations.append(GasStation(lat: 19.36397688,    long: -99.00538649))
    gasStations.append(GasStation(lat: 19.39819175,    long: -99.14553144))
    gasStations.append(GasStation(lat: 19.26751362,    long: -99.16467625))
    gasStations.append(GasStation(lat: 19.47467577,    long: -99.10002428))
    gasStations.append(GasStation(lat: 19.4824064    ,long: -99.19830059))
    gasStations.append(GasStation(lat: 19.52766838,    long: -99.15743541))
    gasStations.append(GasStation(lat: 19.37941406,    long: -99.02414156))
    gasStations.append(GasStation(lat: 19.4536284    ,long: -99.15004874))
    gasStations.append(GasStation(lat: 19.41013352,    long: -99.08037936))
    gasStations.append(GasStation(lat: 19.36677389,    long: -99.15585395))
    gasStations.append(GasStation(lat: 19.46540926,    long: -99.12647756))
    gasStations.append(GasStation(lat: 19.25727149,    long: -99.02134629))
    gasStations.append(GasStation(lat: 19.37533851,    long: -99.07842596))
    gasStations.append(GasStation(lat: 19.41745177,    long: -99.12731037))
    gasStations.append(GasStation(lat: 19.49124307,    long: -99.13608611))
    gasStations.append(GasStation(lat: 19.40754898,    long: -99.08306813))
    gasStations.append(GasStation(lat: 19.37223389,    long: -99.01448408))
    gasStations.append(GasStation(lat: 19.3764058    ,long: -99.08677734))
    gasStations.append(GasStation(lat: 19.30863663,    long: -99.13294699))
    
    
    return gasStations
}
