//
//  NextViewController.swift
//  QuizApp
//
//  Created by 豊岡正紘 on 2019/08/12.
//  Copyright © 2019 Masahiro Toyooka. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UITableViewController {
    
    // 問題結果をマルバツで入れる配列
    var resultQuestion = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タイトルを設定
        navigationItem.title = "結果"
        
    }
    
    // クイズの問題数
    var questionNum: Int = 0
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionNum
    }
    
    // セルの設定
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row + 1)問  \(resultQuestion[indexPath.row])"
        return cell
    }
    
}
