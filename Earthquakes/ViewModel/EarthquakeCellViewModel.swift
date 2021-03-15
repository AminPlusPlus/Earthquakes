//
//  EarthquakeViewModel.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/13/21.
//

import UIKit

final class EarthquakeCellViewModel : EarthquakeCellViewModelType {
    
    //MARK:- Properties
    private var earthquake : Earthquake
    var title: NSAttributedString {
        let nsAttribute = NSAttributedString(string: "📍 \(earthquake.place)",
                                             attributes: [.foregroundColor : UIColor.label,
                                                          .font : UIFont.systemFont(ofSize: 16, weight: .medium)])
        return nsAttribute
    }
    var magnitute: NSAttributedString {
        let nsAttribute = NSAttributedString(string: "🧲 \(earthquake.mag.description)",
                                             attributes: [.foregroundColor : UIColor.label,
                                                          .font : UIFont.systemFont(ofSize: 14, weight: .light)])
        return nsAttribute
    }
     
    init(earthquake : Earthquake) {
        self.earthquake = earthquake
    }
}
