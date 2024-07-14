//
//  DiaryInfo+CoreDataProperties.swift
//  EJDiarySwift
//
//  Created by kazu on 2024/07/14.
//
//

import Foundation
import CoreData


extension DiaryInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryInfo> {
        return NSFetchRequest<DiaryInfo>(entityName: "DiaryInfo")
    }

    @NSManaged public var date: Date?
    @NSManaged public var enText: String?
    @NSManaged public var isEnTextHide: Bool
    @NSManaged public var jpText: String?
    @NSManaged public var isJpTextHide: Bool
    @NSManaged public var title: String?

}

extension DiaryInfo : Identifiable {

}
