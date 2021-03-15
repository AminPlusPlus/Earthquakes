//
//  Earthquake.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/12/21.
//

import Foundation


//MARK:- Earthquakes + APi Metadatas
struct Earthquakes : Codable {
    let title  : String
    let status : Int
    let api    : String
    let limit  : Int
    let offset : Int
    let count  : Int
    let earthquakes : [Earthquake]?
    
    enum CodingKeys : String, CodingKey {
        case metadata
        case earthquakes = "features"
    }
    enum Metadata : String, CodingKey {
        case title
        case status
        case api
        case limit
        case offset
        case count
    }
    
    init(from decoder: Decoder) throws {
        let values   = try decoder.container(keyedBy: CodingKeys.self)
        let metadata = try values.nestedContainer(keyedBy: Metadata.self, forKey: .metadata)
        title = try metadata.decode(String.self, forKey: .title)
        status = try metadata.decode(Int.self, forKey: .status)
        api = try metadata.decode(String.self, forKey: .api)
        limit = try metadata.decode(Int.self, forKey: .limit)
        offset = try metadata.decode(Int.self, forKey: .offset)
        count = try metadata.decode(Int.self, forKey: .count)
        earthquakes = try values.decode([Earthquake].self, forKey: .earthquakes)
    }
    func encode(to encoder: Encoder) throws {
        
    }
}

//MARK:- Earthquake Properties
struct Earthquake : Codable {
    let id     : String
    let title  : String
    let url    : String
    let status : String
    let detail : String
    let place  : String
    let mag    : Double
    let time   : Int
    let lat    : Double
    let long   : Double
    let depth  : Double
    
    enum CodingKeys : String, CodingKey {
        case id
        case geometry
        case properties
    }
    enum Properties : String, CodingKey {
        case title
        case url
        case detail
        case place
        case mag
        case time
        case status
    }
    enum Geometry : String, CodingKey {
        case coordinates
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let prop = try values.nestedContainer(keyedBy: Properties.self, forKey: .properties)
        let geo = try values.nestedContainer(keyedBy: Geometry.self, forKey: .geometry)
        
        //Set Properties
        id = try values.decode(String.self, forKey: .id)
        title = try prop.decode(String.self, forKey: .title)
        url = try prop.decode(String.self, forKey: .url)
        detail = try prop.decode(String.self, forKey: .detail)
        place = try prop.decode(String.self, forKey: .place)
        mag = try prop.decode(Double.self, forKey: .mag)
        time = try prop.decode(Int.self, forKey: .time)
        status = try prop.decode(String.self, forKey: .status)
        
        //Decoding Coordinates
        let cord = try geo.decode([Double].self,forKey: .coordinates)
        long  = cord[0]
        lat   = cord[1]
        depth = cord[2]
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}
