//
//  AccessibilityIdentifiers.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/14/21.
//

import Foundation

public enum AccessibilityIdentifiers {
   
    public enum AXEarthquakeMainView {
        public static let EarthquakeTableView = "EarthquakeMain.TableView"
        public static let ReloadButton = "NavigationItem.ReloadButton"
    }
    public enum AXEarthquakeTableCell {
        public static let title = "EarthquakeTableCell.Title"
        public static let subTitle = "EarthquakeTableCell.SubTitle"
    }
}
