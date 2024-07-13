//
//  TopViewController.swift
//  EJDiarySwift
//
//  Created by kazu on 2024/07/08.
//

import UIKit

class TopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var createButton: UIButton!
    let dataList = [
        "2024/01/01",
        "2024/05/10",
        "2024/07/01",
        "2024/07/02",
        "2024/07/03",
        "2024/07/04",
        "2024/07/05",
        "2024/07/06",
        "2024/07/07",
        "2024/07/08",
        "2024/07/09",
        "2024/07/10",
        "2024/07/11",
        "2024/07/12",
        "2024/07/13",
        "2024/07/14",
        "2024/07/15",
        "2024/07/16",
        "2024/07/17",
        "2024/07/18",
        "2024/07/19",
        "2024/07/20",
        "2024/12/15"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigation()
        createDiaryButton()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diaryCell", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDiary", sender: indexPath)
    }
    
    /**
     Init Navigation area.
     */
    func initNavigation() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemCyan]
        title = "EJDiary"
        
        // rightButton
        let rightButton = UIBarButtonItem(title: "config", style: .plain, target: self, action: #selector(configButton))
        navigationItem.rightBarButtonItem = rightButton
        rightButton.tintColor = .systemCyan
    }
    
    /**
     設定画面に遷移する処理
     */
    @objc func configButton() {
        // Todo
        performSegue(withIdentifier: "toConfig", sender: self)
    }
    
    /**
     Page transition to the create diary screen.
     */
    @IBAction func createDiaryButton(_ sender: Any) {
        performSegue(withIdentifier: "toCreateDiary", sender: self)
    }
    
    /**
     Set layout to create a diary button .
     */
    func createDiaryButton() {
        createButton.layer.cornerRadius = 35
        createButton.layer.shadowColor = UIColor.black.cgColor
        createButton.layer.shadowRadius = 3
        createButton.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        createButton.layer.shadowOpacity = 1.0
    }
    
}
