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
    
    // クイズの問題数
    var questionNum: Int?
    
    // 正解した問題の数
    var correctNum: Int?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        return cell
    }
    
}
