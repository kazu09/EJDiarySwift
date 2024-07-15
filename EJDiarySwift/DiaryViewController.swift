//
//  ViewController.swift
//  EJDiarySwift
//
//  Created by kazu on 2024/01/09.
//

import UIKit

class DiaryViewController: UIViewController {
    // diary info
    var diary: DiaryInfo?
    var date: Date?
    
    // Text hide flag.
    var isEnTextHide: Bool = false
    var isJpTextHide: Bool = false
    
    // Input area
    @IBOutlet weak var jpTextInput: UITextView!
    @IBOutlet weak var enTextInput: UITextView!
    
    // button
    @IBOutlet weak var jpHideButton: UIButton!
    @IBOutlet weak var enHideButton: UIButton!
    
    // hide text
    @IBOutlet weak var jpHideText: UILabel!
    @IBOutlet weak var enHideText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let diary = diary {
            jpTextInput.text = diary.jpText
            enTextInput.text = diary.enText
            isJpTextHide = diary.isJpTextHide
            isEnTextHide = diary.isEnTextHide
            date = diary.date
        }
        initNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        jpHide(textHide: isJpTextHide)
        enHide(textHide: isEnTextHide)
    }
    
    // hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /**
     Change the jp text area to visible or invisible.
     */
    @IBAction func jpHideButtonEvent(_ sender: Any) {
        changeJpHideFlag(textHide: isJpTextHide)
        jpHide(textHide: isJpTextHide)
    }
    
    /**
     Change the en text area to visible or invisible.
     */
    @IBAction func enHideButtonEvent(_ sender: Any) {
        changeEnHideFlag(textHide: isEnTextHide)
        enHide(textHide: isEnTextHide)
    }
    
    /**
     Init Navigation area.
     */
    private func initNavigation() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "Update Diary"
    }
    
    /**
     Switch from jp input area to jp hide text.
     */
    private func jpHide(textHide: Bool) {
        if (textHide) {
            jpTextInput.isHidden = true
            jpHideText.isHidden = false
            isJpTextHide = true
            jpHideButton.setTitle("日本語の日記を戻す", for: .normal)
        } else {
            jpTextInput.isHidden = false
            jpHideText.isHidden = true
            isJpTextHide = false
            jpHideButton.setTitle("日本語の日記を隠す", for: .normal)
        }
    }
    
    /**
     Switch from en input area to en hide text.
     */
    private func enHide(textHide: Bool) {
        if (textHide) {
            enTextInput.isHidden = true
            enHideText.isHidden = false
            enHideButton.setTitle("Show english diary", for: .normal)
        } else {
            enTextInput.isHidden = false
            enHideText.isHidden = true
            enHideButton.setTitle("Hide english diary", for: .normal)
        }
    }
    
    /**
     Switch jp text hide flag.
     */
    private func changeJpHideFlag(textHide: Bool) {
        if (textHide) {
            isJpTextHide = false
        } else {
            isJpTextHide = true
        }
    }
    
    /**
     Switch en text hide flag.
     */
    private func changeEnHideFlag(textHide: Bool) {
        if (textHide) {
            isEnTextHide = false
        } else {
            isEnTextHide = true
        }
    }
    
    private func showToast(message: String, duration: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            alert.dismiss(animated: true)
        }
    }
    
    @IBAction func updateButton(_ sender: Any) {
        let diary = diary!
        let date = date!
        let jpText = jpTextInput.text!
        let enText = enTextInput.text!
        // unused index
        let title = ""
        CoreDataManager.shared.updateDiaryInfo(diary: diary, 
                                               newDate: date,
                                               newJpText: jpText,
                                               newIsJpTextHide: isJpTextHide,
                                               newEnText: enText,
                                               newIsEnTextHide: isEnTextHide,
                                               newTitle: title
        )
        showToast(message: "更新しました", duration: 1.0)
    }
}

