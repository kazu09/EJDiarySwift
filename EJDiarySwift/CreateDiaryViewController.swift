//
//  CreateDiaryViewController.swift
//  EJDiarySwift
//
//  Created by kazu on 2024/07/11.
//

import UIKit

class CreateDiaryViewController: UIViewController {
    // diary info
    var diary: DiaryInfo?
    
    // InputArea
    @IBOutlet weak var jpTextInput: UITextView!
    @IBOutlet weak var enTextInput: UITextView!
    
    // Button
    @IBOutlet weak var jpHideButton: UIButton!
    @IBOutlet weak var enHideButton: UIButton!
    
    // Text
    @IBOutlet weak var jpHideText: UILabel!
    @IBOutlet weak var enHideText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    // hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
    
    /**
     Init view.
     */
    private func initView() {
        setStatusBarBackgroundColor(.cyan)
        initNavigation()
        jpHideText.isHidden = true
        enHideText.isHidden = true
    }
    
    /**
     Init Navigation area.
     */
    private func initNavigation() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "New Diary"
        
        let leftButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButton))
        navigationItem.leftBarButtonItem = leftButton
        leftButton.tintColor = .white
    }
    
    @IBAction func jpHideButtonEvent(_ sender: Any) {
        if (jpTextInput.isHidden) {
            jpTextInput.isHidden = false
            jpHideText.isHidden = true
            jpHideButton.setTitle("日本語の日記を隠す", for: .normal)
        } else {
            jpTextInput.isHidden = true
            jpHideText.isHidden = false
            jpHideButton.setTitle("日本語の日記を戻す", for: .normal)
        }
        
    }
    
    @IBAction func enHideButtonEvent(_ sender: Any) {
        if (enTextInput.isHidden) {
            enTextInput.isHidden = false
            enHideText.isHidden = true
            enHideButton.setTitle("Hide english diary", for: .normal)
        } else {
            enTextInput.isHidden = true
            enHideText.isHidden = false
            enHideButton.setTitle("Show english diary", for: .normal)
            
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let date = Date()
        let jpText = jpTextInput.text!
        let enText = enTextInput.text!
        let isJpTextHide = false
        let isEnTextHide = false
        // unused index
        let title = ""
        
        // Create Data.
        CoreDataManager.shared.createDiaryInfo(date: date, jpText: jpText, isJpTextHide: isJpTextHide, enText: enText, isEnTextHide: isEnTextHide, title: title)
        dismiss(animated: true, completion: nil)
    }
}
