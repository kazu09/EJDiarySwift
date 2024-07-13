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

}
