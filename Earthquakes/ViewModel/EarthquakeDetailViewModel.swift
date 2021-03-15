//
//  EarthquakeDetailViewModel.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/13/21.
//

import UIKit

final class EarthquakeDetailViewModel : EarthquakeDetailViewModelType {
    
    //MARK:- Properties
    private var earthquake : Earthquake
    
    var place: NSAttributedString {
        let nsAttribute = NSAttributedString(string: "📍 \(earthquake.place)",
                          attributes: [.foregroundColor : UIColor.label,
                          .font : UIFont.systemFont(ofSize: 25, weight: .medium)])
        return nsAttribute
    }
    var magnitute: NSAttributedString {
        let nsAttribute = NSAttributedString(string: "🧲 \(earthquake.mag.description)",
                          attributes: [.foregroundColor : UIColor.label,
                          .font : UIFont.systemFont(ofSize: 15, weight: .light)])
        return nsAttribute
    }
    var status: NSAttributedString {
        let nsAttribute = NSAttributedString(string: "📣 \(earthquake.status)",
                          attributes: [.foregroundColor : UIColor.label,
                          .font : UIFont.systemFont(ofSize: 15, weight: .light)])
        return nsAttribute
        
    }
    var depth: NSAttributedString {
        let nsAttribute = NSAttributedString(string: "〽️ \(earthquake.depth.description) Km",
                          attributes: [.foregroundColor : UIColor.label,
                          .font : UIFont.systemFont(ofSize: 15, weight: .light)])
        return nsAttribute}
    var detailURL: URL {
        guard let url = URL(string: earthquake.url) else {
            return URL(string: "https://earthquake.usgs.gov")!
        }
        return url
    }
    
    init(earthquake : Earthquake) {
        self.earthquake = earthquake
    }
}
