//
//  ContentView.swift
//  AddTaskCoredata
//
//  Created by Adam Ibnu fiadi on 05/08/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Activities.entity(), sortDescriptors: [])
    private var activity: FetchedResults<Activities>

    @State var addActivityPage = false

    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    
                    ForEach(activity) { activities in
                        HStack {
                            
                            NavigationLink(destination: ActivityPreviewPage()) {
                                
                                VStack(alignment: .leading) {
                                    Text("\(activities.activityName)")
                                        .font(.headline)
                                    Text("\(activities.activityCategory)")
                                        .font(.subheadline)
                                    Text("\(activities.activityDescription)").font(.subheadline)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                .navigationTitle(Text("My Activity"))
                .navigationBarItems(trailing: Button(action: {
                    addActivityPage = true
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }))
                .sheet(isPresented: $addActivityPage) {
                    AddActivityPage()
                }
                
            }
        }
        
        
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
    
    
}

