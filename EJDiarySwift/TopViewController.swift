//
//  TopViewController.swift
//  EJDiarySwift
//
//  Created by kazu on 2024/07/08.
//

import UIKit

class TopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // instance
    private let coreDataManager = CoreDataManager.shared
    
    // table view
    @IBOutlet weak var tableView: UITableView!
    
    // button
    @IBOutlet weak var createButton: UIButton!
    
    // datalist
    private var dataList: [DiaryInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigation()
        createDiaryButton()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        checkDisabledButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDiary" {
            if let destinationVC = extractDiaryViewController(from: segue.destination) {
                if let diary = sender as? DiaryInfo {
                    destinationVC.diary = diary
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diaryCell", for: indexPath)
        let diary = dataList[indexPath.row]
        if let date = diary.date {
            cell.textLabel?.text = formatDateToJapanTime(date: date)
        } else {
            cell.textLabel?.text = "No date"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDiary = dataList[indexPath.row]
        performSegue(withIdentifier: "toDiary", sender: selectedDiary)
    }
    
    /**
     Table view setup.
     */
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "diaryCell")
    }
    
    /**
     set data list to tableview.
     */
    private func fetchData() {
        dataList = fetchAllDiaries()
        tableView.reloadData()
    }
    
    /**
     DiaryViewController or DiaryViewController judgment.
     */
    private func extractDiaryViewController(from destination: UIViewController) -> DiaryViewController? {
        if let navigationController = destination as? UINavigationController {
            return navigationController.topViewController as? DiaryViewController
        } else {
            return destination as? DiaryViewController
        }
    }
    
    /**
     Get caredata.
     */
    private func fetchAllDiaries() -> [DiaryInfo] {
        return coreDataManager.fetchAllDiaryInfoes()
    }
    
    /**
     Convert to japan date.
     */
    private func formatDateToJapanTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.string(from: date)
    }
    
    /**
     Set layout to create a diary button .
     */
    private func createDiaryButton() {
        createButton.layer.cornerRadius = 35
        createButton.layer.shadowColor = UIColor.black.cgColor
        createButton.layer.shadowRadius = 3
        createButton.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        createButton.layer.shadowOpacity = 1.0
    }
    
    /**
     Init Navigation area.
     */
    private func initNavigation() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemCyan]
        title = "EJDiary"
        
        // configボタン デバッグのボタンしかないためコメントアウト対応
        //let rightButton = UIBarButtonItem(title: "config", style: .plain, target: self, action: #selector(configButton))
        //navigationItem.rightBarButtonItem = rightButton
        //rightButton.tintColor = .systemCyan
    }
    
    /**
     Check whether to disable the create button.
     */
    private func checkDisabledButton() {
        let todayDiaryInfos = coreDataManager.fetchDiaryInfoForToday()
        let test = todayDiaryInfos.isEmpty
        if (!test) {
            createButton.isEnabled = test
            createButton.backgroundColor = UIColor(colorCode: "AAAAAA")
        } else {
            createButton.isEnabled = true
            createButton.backgroundColor = UIColor(colorCode: "ABE1FA")
        }
    }
    
    @IBAction func createDiaryButton(_ sender: Any) {
        performSegue(withIdentifier: "toCreateDiary", sender: self)
    }
    
    /**
     設定画面に遷移する処理　デバッグのボタンしかないためコメントアウト
     */
    @objc func configButton() {
        // performSegue(withIdentifier: "toConfig", sender: self)
    }
}
