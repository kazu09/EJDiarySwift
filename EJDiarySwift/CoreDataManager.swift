//
//  CoreDataManager.swift
//  EJDiarySwift
//
//  Created by kazu on 2024/07/14.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func createDiaryInfo(date: Date, 
                         jpText: String,
                         isJpTextHide: Bool,
                         enText: String,
                         isEnTextHide: Bool,
                         title: String
    ) {
        let newDiaryInfo = EJDiarySwift.DiaryInfo(context: context)
        newDiaryInfo.date = date
        newDiaryInfo.jpText = jpText
        newDiaryInfo.isJpTextHide = isJpTextHide
        newDiaryInfo.enText = enText
        newDiaryInfo.isEnTextHide = isEnTextHide
        newDiaryInfo.title = title
        
        saveContext()
    }
    
    func fetchAllDiaryInfoes() -> [EJDiarySwift.DiaryInfo] {
        let fetchRequest: NSFetchRequest<EJDiarySwift.DiaryInfo> = EJDiarySwift.DiaryInfo.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch DiaryInfo: \(error)")
            return []
        }
    }
    
    func updateDiaryInfo(diary: EJDiarySwift.DiaryInfo, 
                         newDate: Date,
                         newJpText: String,
                         newIsJpTextHide: Bool,
                         newEnText: String,
                         newIsEnTextHide: Bool,
                         newTitle: String
    ) {
        diary.date = newDate
        diary.jpText = newJpText
        diary.isJpTextHide = newIsJpTextHide
        diary.enText = newEnText
        diary.isEnTextHide = newIsEnTextHide
        diary.title = newTitle
        
        saveContext()
    }
    
    func deleteDiary(diary: EJDiarySwift.DiaryInfo) {
        context.delete(diary)
        
        saveContext()
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}
