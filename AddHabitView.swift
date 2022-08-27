//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Alpay Calalli on 11.08.22.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var activities: Activities
    
    @State private var date = Date()
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var hoursPerDay = 1
    
    let types = ["Health", "Work", "Personal", "Hobby"]
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name", text: $name)
                }header: {
                    Text("Enter the name of your habit")
                }

                Section{
                    Picker("Type", selection: $type){
                        ForEach(types, id: \.self){
                            Text($0)
                        }
                        .pickerStyle(.segmented)
                    }
                }header: {
                    Text("Select the type of your habit")
                }
                
                Section{
                    DatePicker(selection: $date, in: ...Date(), displayedComponents: .date){
                        Text("Date:")
                    }
                    Picker("I want to spend", selection: $hoursPerDay){
                        ForEach(1..<6){
                            Text("\($0) hours")
                        }
                    }
                }header: {
                    Text("Habit properties")
                }
                
                Button("Save", action: addNewHabit)
                
                
            }
            .navigationTitle("Add Habit")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
    func addNewHabit(){
           let item = HabitItem(name: name,type: type, hours: hoursPerDay)
           activities.items.append(item)
           
           name = ""
        
           dismiss()
       }

}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(activities: Activities())
    }
}
