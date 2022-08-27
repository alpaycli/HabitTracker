//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Alpay Calalli on 11.08.22.
//

import SwiftUI

struct HabitDetailView: View {
    let activities: Activities
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var hoursPerDay = 1
    
    var body: some View {
        //let item = HabitItem(name: name,type: type, hours: hoursPerDay)
        NavigationView{
            
        }
        //.navigationTitle()
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(activities: Activities())
    }
}
