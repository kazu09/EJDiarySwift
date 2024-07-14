//
//  Config.swift
//  EJDiarySwift
//
//  Created by kazu on 2024/07/13.
//

import UIKit

class ConfigViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
    
    /**
     Init view.
     */
    func initView() {
        setStatusBarBackgroundColor(.cyan)
        initNavigation()
    }
    
    /**
     Init Navigation area.
     */
    func initNavigation() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "Config"
        
        let leftButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButton))
        navigationItem.leftBarButtonItem = leftButton
        leftButton.tintColor = .white
    }
    
    /** Debug Area  */
    
    @IBAction func dataDeleteButton(_ sender: Any) {
        print("dataDeleteButton!")
        if let diary = CoreDataManager.shared.fetchAllDiaryInfoes().first {
            CoreDataManager.shared.deleteDiary(diary: diary)
        }
    }
    
    @IBAction func datafetchButton(_ sender: Any) {
        // データの取得
        print("datafetchButton!")
        let diaries = CoreDataManager.shared.fetchAllDiaryInfoes()
        for diary in diaries {
            print("Title: \(diary.title ?? ""), Date: \(diary.date ?? Date()), JpText: \(diary.jpText ?? ""), IsJpTextHide : \(diary.isJpTextHide), enText: \(diary.enText ?? ""), IsEnTextHide: \(diary.isEnTextHide) ")
        }
    }
}
