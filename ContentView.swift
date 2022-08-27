//
//  ContentView.swift
//  HabitTracker
//
//  Created by Alpay Calalli on 10.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var activities = Activities()
    
    @State private var addHabitItem = false
    var body: some View {
        NavigationView{
            List{   
                Section{
                    ForEach(activities.items){ item in
                        NavigationLink{
                            // view
                        }label: {
                            HStack{
                                VStack{
                                    Text(item.name)
                                        .fontWeight(.bold)
                                    Text(item.type)
                                        .font(.subheadline.italic())
                                        .foregroundColor(.indigo)
                                }
                                Spacer()
                                Text("\(item.hours) hours left today")
                            }
                        }
                    }.onDelete(perform: deleteRows)
                }
            }
            .navigationTitle("HabitTracker")
            .toolbar{
                Button{
                    addHabitItem = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $addHabitItem){
                AddHabitView(activities: activities)
            }
        }
        
        
    }
    func deleteRows(at offsets: IndexSet){
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
