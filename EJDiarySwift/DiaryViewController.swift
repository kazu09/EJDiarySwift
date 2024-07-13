//
//  ViewController.swift
//  EJDiarySwift
//
//  Created by kazu on 2024/01/09.
//

import UIKit

class DiaryViewController: UIViewController {
    // Inputエリア
    @IBOutlet weak var jpTextInput: UITextView!
    @IBOutlet weak var enTextInput: UITextView!
    
    // ボタン
    @IBOutlet weak var jpHideButton: UIButton!
    @IBOutlet weak var enHideButton: UIButton!
    
    // テキスト
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
    
    /**
     Init view.
     */
    func initView() {
        initNavigation()
        jpHideText.isHidden = true
        enHideText.isHidden = true
    }
    
    /**
     Init Navigation area.
     */
    func initNavigation() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "Update Diary"
    }
    
    /**
     Change the jp text area to visible or invisible.
     */
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
    
    /**
     Change the en text area to visible or invisible.
     */
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
}

