//
//  AddActivityPage.swift
//  ActivityOrganizerNC2
//
//  Created by Adam Ibnu fiadi on 28/07/22.
//

import SwiftUI

struct AddActivityPage: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var activityName = ""
    @State var activityCategory = ""
    @State var activityDescription = ""
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section(header: Text("Activity Name")) {
                    TextField("Activity Name", text: $activityName)
                    
                    
                }
                
                Section(header: Text("Activity Category")) {
                    TextField("Activity Category", text: $activityCategory)
                    
                    
                }
                
                Section(header: Text("Activity Description")) {
                    TextField("", text: $activityDescription)
                        .frame( height: 150, alignment: .leading)
                    
                }
                
                Button(action: {
                    
                    let newActivities = Activities(context: viewContext)
                    newActivities.activityName = self.activityName
                    newActivities.activityCategory = self.activityCategory
                    newActivities.activityDescription = self.activityDescription
                    
                    
                    do {
                        try viewContext.save()
                        print("Activity Saved")
                        self.presentationMode.wrappedValue.dismiss()
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }) {
                    Text("Add Activity")
                        .fontWeight(.bold)
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .listRowBackground(Color.clear)
                
            }.navigationTitle(Text("Add Activity"))
            
            
        }
        
    }
}

struct AddActivityPage_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityPage()
    }
}
