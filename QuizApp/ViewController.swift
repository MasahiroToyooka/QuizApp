//
//  ViewController.swift
//  QuizApp
//
//  Created by 豊岡正紘 on 2019/08/12.
//  Copyright © 2019 Masahiro Toyooka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var quizData: [[String: Any]] = [
        ["text": "日本の世界遺産『富士山－信仰の対象と芸術の源泉』は、2013年に（ ）として世界遺産登録されました。\n1. 文化遺産\n2. 自然遺産\n3. 山岳遺産\n4. 伝統遺産", "true": 1, "buttonNum": 4],
        ["text": "イタリア共和国の世界遺産『フィレンツェの歴史地区』のあるフィレンツェを中心に、17世紀に栄えた芸術運動は何でしょうか。\n1. シュルレアリスム\n2. アバンギャルド\n3. ルネサンス", "true": 3, "buttonNum": 3],
        ["text": "2016年のオリンピック開催地であるリオ・デ・ジャネイロで、ブラジル独立100周年を記念して作られたキリスト像が立つ場所として、正しいものはどれか。\n1. コパカバーナの山\n2. コルコバードの丘", "true": 2, "buttonNum": 2],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

