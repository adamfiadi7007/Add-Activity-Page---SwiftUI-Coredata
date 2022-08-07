//
//  ActivityPreviewPage.swift
//  ActivityOrganizerNC2
//
//  Created by Adam Ibnu fiadi on 29/07/22.
//

import SwiftUI

struct ActivityPreviewPage: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Activities.entity(), sortDescriptors: [])

    private var activity: FetchedResults<Activities>
    
    var body: some View {
        
        ForEach(activity) { activities in
                
                VStack(alignment: .leading) {
                    Text("\(activities.activityName)")
                        .font(.headline)
                    Text("\(activities.activityCategory)")
                        .font(.subheadline)
                    
                }
            
        }
    }
    
}

struct ActivityPreviewPage_Previews: PreviewProvider {
    static var previews: some View {
        ActivityPreviewPage()
        
    }
}

