//
//  HabitItem.swift
//  HabitTracker
//
//  Created by Alpay Calalli on 10.08.22.
//

import Foundation

struct HabitItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let hours: Int
}
