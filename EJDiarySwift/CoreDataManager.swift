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
    
    /**
     Add Diary info.
     */
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
    
    /**
     Get diary info.
     */
    func fetchAllDiaryInfoes() -> [EJDiarySwift.DiaryInfo] {
        let fetchRequest: NSFetchRequest<EJDiarySwift.DiaryInfo> = EJDiarySwift.DiaryInfo.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch DiaryInfo: \(error)")
            return []
        }
    }
    
    /**
     Update diary info.
     */
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
    
    /**
     Delete diary info.
     */
    func deleteDiary(diary: EJDiarySwift.DiaryInfo) {
        context.delete(diary)
        saveContext()
    }
    
    /**
     Cheack today for diary.
     */
    func fetchDiaryInfoForToday() -> [DiaryInfo] {
        let fetchRequest: NSFetchRequest<DiaryInfo> = DiaryInfo.fetchRequest()
        
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        guard let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay) else {
            return []
        }
        
        let predicate = NSPredicate(format: "date >= %@ AND date < %@", startOfDay as NSDate, endOfDay as NSDate)
        fetchRequest.predicate = predicate
        
        do {
            let results = try context.fetch(fetchRequest)
            return results
        } catch {
            print("Failed to fetch diaryInfo for today: \(error)")
            return []
        }
    }
    
    /**
     Get today date.
     */
    private func getTodayDate() -> Date {
        let calendar = Calendar.current
        let date = Date()
        return calendar.startOfDay(for: date)
    }
    
    /**
    Save context.
     */
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
