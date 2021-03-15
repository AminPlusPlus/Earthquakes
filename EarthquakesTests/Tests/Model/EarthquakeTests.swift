//
//  EarthquakeTests.swift
//  EarthquakesTests
//
//  Created by Aminjoni Abdullozoda on 3/14/21.
//

import XCTest
@testable import Earthquakes

class EarthquakeTests: XCTestCase {
    
    func testDecodeEarthquake() throws {
        let earthQuakes = try EarthquakeTests.createEarthquakeFromJSON()
        
        XCTAssertEqual(earthQuakes.api, "1.10.3")
    }
    
    func testDecodeTitle() throws {
        let earthQuakes = try EarthquakeTests.createEarthquakeFromJSON()
        
        XCTAssertEqual(earthQuakes.title, "USGS Earthquakes")
    }
    
    func testDecodeEarthquakeListNotEmpty() throws {
        let earthQuakes = try EarthquakeTests.createEarthquakeFromJSON()
        
        XCTAssertEqual(!earthQuakes.earthquakes!.isEmpty, true)
    }
    
    static func createEarthquakeFromJSON() throws -> Earthquakes {
        return try UnitTestHelpers.sharedJSONDecoder.decode(Earthquakes.self, from: EarthquakeTests.EarthquakeJSON)
    }
    
    
    //MARK:-  JSON Datas
    static let EarthquakeJSON = """
    {
        "type": "FeatureCollection",
        "metadata": {
            "generated": 1615705975000,
            "url": "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2021-02-11&limit=5&orderby=time&offset=1&eventtype=earthquake&endtime=2021-03-11",
            "title": "USGS Earthquakes",
            "status": 200,
            "api": "1.10.3",
            "limit": 5,
            "offset": 1,
            "count": 5
        },
        "features": [
            {
                "type": "Feature",
                "properties": {
                    "mag": 1.5,
                    "place": "31 km SSE of Mina, Nevada",
                    "time": 1615420794186,
                    "updated": 1615430007338,
                    "tz": null,
                    "url": "https://earthquake.usgs.gov/earthquakes/eventpage/nn00802353",
                    "detail": "https://earthquake.usgs.gov/fdsnws/event/1/query?eventid=nn00802353&format=geojson",
                    "felt": null,
                    "cdi": null,
                    "mmi": null,
                    "alert": null,
                    "status": "reviewed",
                    "tsunami": 0,
                    "sig": 35,
                    "net": "nn",
                    "code": "00802353",
                    "ids": ",nn00802353,",
                    "sources": ",nn,",
                    "types": ",origin,phase-data,",
                    "nst": 20,
                    "dmin": 0.03,
                    "rms": 0.103,
                    "gap": 92.92,
                    "magType": "ml",
                    "type": "earthquake",
                    "title": "M 1.5 - 31 km SSE of Mina, Nevada"
                },
                "geometry": {
                    "type": "Point",
                    "coordinates": [
                        -117.9093,
                        38.1497,
                        7.8
                    ]
                },
                "id": "nn00802353"
            },
            {
                "type": "Feature",
                "properties": {
                    "mag": 1.2,
                    "place": "7km NW of The Geysers, CA",
                    "time": 1615420641710,
                    "updated": 1615438805970,
                    "tz": null,
                    "url": "https://earthquake.usgs.gov/earthquakes/eventpage/nc73533611",
                    "detail": "https://earthquake.usgs.gov/fdsnws/event/1/query?eventid=nc73533611&format=geojson",
                    "felt": null,
                    "cdi": null,
                    "mmi": null,
                    "alert": null,
                    "status": "reviewed",
                    "tsunami": 0,
                    "sig": 22,
                    "net": "nc",
                    "code": "73533611",
                    "ids": ",nc73533611,",
                    "sources": ",nc,",
                    "types": ",focal-mechanism,nearby-cities,origin,phase-data,scitech-link,",
                    "nst": 40,
                    "dmin": 0.009792,
                    "rms": 0.03,
                    "gap": 48,
                    "magType": "md",
                    "type": "earthquake",
                    "title": "M 1.2 - 7km NW of The Geysers, CA"
                },
                "geometry": {
                    "type": "Point",
                    "coordinates": [
                        -122.8225,
                        38.8171667,
                        2.44
                    ]
                },
                "id": "nc73533611"
            },
            {
                "type": "Feature",
                "properties": {
                    "mag": 1.56,
                    "place": "16km ESE of Point Sur, CA",
                    "time": 1615420379890,
                    "updated": 1615434064542,
                    "tz": null,
                    "url": "https://earthquake.usgs.gov/earthquakes/eventpage/nc73533606",
                    "detail": "https://earthquake.usgs.gov/fdsnws/event/1/query?eventid=nc73533606&format=geojson",
                    "felt": null,
                    "cdi": null,
                    "mmi": null,
                    "alert": null,
                    "status": "reviewed",
                    "tsunami": 0,
                    "sig": 37,
                    "net": "nc",
                    "code": "73533606",
                    "ids": ",nc73533606,",
                    "sources": ",nc,",
                    "types": ",nearby-cities,origin,phase-data,scitech-link,",
                    "nst": 23,
                    "dmin": 0.02407,
                    "rms": 0.1,
                    "gap": 106,
                    "magType": "md",
                    "type": "earthquake",
                    "title": "M 1.6 - 16km ESE of Point Sur, CA"
                },
                "geometry": {
                    "type": "Point",
                    "coordinates": [
                        -121.7433333,
                        36.2423333,
                        13.07
                    ]
                },
                "id": "nc73533606"
            },
            {
                "type": "Feature",
                "properties": {
                    "mag": 1.65,
                    "place": "5km WNW of Cobb, CA",
                    "time": 1615419955740,
                    "updated": 1615499346024,
                    "tz": null,
                    "url": "https://earthquake.usgs.gov/earthquakes/eventpage/nc73533601",
                    "detail": "https://earthquake.usgs.gov/fdsnws/event/1/query?eventid=nc73533601&format=geojson",
                    "felt": null,
                    "cdi": null,
                    "mmi": null,
                    "alert": null,
                    "status": "reviewed",
                    "tsunami": 0,
                    "sig": 42,
                    "net": "nc",
                    "code": "73533601",
                    "ids": ",nc73533601,",
                    "sources": ",nc,",
                    "types": ",focal-mechanism,nearby-cities,origin,phase-data,scitech-link,",
                    "nst": 42,
                    "dmin": 0.008791,
                    "rms": 0.04,
                    "gap": 48,
                    "magType": "md",
                    "type": "earthquake",
                    "title": "M 1.7 - 5km WNW of Cobb, CA"
                },
                "geometry": {
                    "type": "Point",
                    "coordinates": [
                        -122.781,
                        38.8335,
                        1.98
                    ]
                },
                "id": "nc73533601"
            },
            {
                "type": "Feature",
                "properties": {
                    "mag": 5.1,
                    "place": "south of the Kermadec Islands",
                    "time": 1615419887403,
                    "updated": 1615420894040,
                    "tz": null,
                    "url": "https://earthquake.usgs.gov/earthquakes/eventpage/us7000dhzz",
                    "detail": "https://earthquake.usgs.gov/fdsnws/event/1/query?eventid=us7000dhzz&format=geojson",
                    "felt": null,
                    "cdi": null,
                    "mmi": null,
                    "alert": null,
                    "status": "reviewed",
                    "tsunami": 0,
                    "sig": 400,
                    "net": "us",
                    "code": "7000dhzz",
                    "ids": ",us7000dhzz,",
                    "sources": ",us,",
                    "types": ",origin,phase-data,",
                    "nst": null,
                    "dmin": 5.15,
                    "rms": 1.07,
                    "gap": 77,
                    "magType": "mb",
                    "type": "earthquake",
                    "title": "M 5.1 - south of the Kermadec Islands"
                },
                "geometry": {
                    "type": "Point",
                    "coordinates": [
                        -178.4171,
                        -33.1515,
                        10
                    ]
                },
                "id": "us7000dhzz"
            }
        ],
        "bbox": [
            -178.4171,
            -33.1515,
            1.98,
            -117.9093,
            38.8335,
            13.07
        ]
    }
    """.data(using: .utf8)!

}
