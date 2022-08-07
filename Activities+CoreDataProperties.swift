//
//  Activities+CoreDataProperties.swift
//  AddTaskCoredata
//
//  Created by Adam Ibnu fiadi on 05/08/22.
//
//

import Foundation
import CoreData


extension Activities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activities> {
        return NSFetchRequest<Activities>(entityName: "Activities")
    }

    @NSManaged public var activityName: String
    @NSManaged public var activityCategory: String
    @NSManaged public var activityDescription: String

}

extension Activities : Identifiable {

}

