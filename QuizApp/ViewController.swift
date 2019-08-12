//
//  ViewController.swift
//  QuizApp
//
//  Created by 豊岡正紘 on 2019/08/12.
//  Copyright © 2019 Masahiro Toyooka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // ４つの解答用ボタン
    @IBOutlet weak var number1Button: UIButton!
    @IBOutlet weak var number2Button: UIButton!
    @IBOutlet weak var number3Button: UIButton!
    @IBOutlet weak var number4Button: UIButton!
    
    // 問題表示用のテキストビュー
    @IBOutlet weak var quizText: UITextView!
    
    // クイズのデータ
    var quizData: [[String: Any]] = [
        ["text": "日本の世界遺産『富士山－信仰の対象と芸術の源泉』は、2013年に（ ）として世界遺産登録されました。\n1. 文化遺産\n2. 自然遺産\n3. 山岳遺産\n4. 伝統遺産", "true": 1, "buttonNum": 4],
        ["text": "イタリア共和国の世界遺産『フィレンツェの歴史地区』のあるフィレンツェを中心に、17世紀に栄えた芸術運動は何でしょうか。\n1. シュルレアリスム\n2. アバンギャルド\n3. ルネサンス", "true": 3, "buttonNum": 3],
        ["text": "2016年のオリンピック開催地であるリオ・デ・ジャネイロで、ブラジル独立100周年を記念して作られたキリスト像が立つ場所として、正しいものはどれか。\n1. コパカバーナの山\n2. コルコバードの丘", "true": 2, "buttonNum": 2],
    ]
    
    // 解答結果をマルバツの文字列で格納する配列
    var resultQuestion = [String]()
    
    // 現在の問題番号
    var currentNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonAction()
        setupQuiz()
    }
    
    
    //MARK:- functions

    
    // 問題の正誤判定するやつ
    func checkAnswer(yourAnswer: Int) {
        
        let question = quizData[currentNum]
        
        
        if yourAnswer == question["true"] as! Int{
            // 正解
            
            currentNum += 1
            
            
            // 最後の問題の時の処理
            if currentNum >= quizData.count {
                
                showAlert(title: "正解", message: "次に進みます", result: true, last: true)

            } else {
                showAlert(title: "正解", message: "次に進みます", result: true, last: false)
            }
        } else {
            // 不正解
            
            currentNum += 1
            
            // 最後の問題の時の処理
            if currentNum >= quizData.count {
                
                showAlert(title: "不正解", message: "次に進みますか？", result: false, last: true)

            } else {
                showAlert(title: "不正解", message: "次に進みますか？", result: false, last: false)
            }
        }
    }
    
    // currentNumに合わせて問題をを更新
    func setupQuiz() {
        // ボタンの数を変更します
        changeButtonNum()
        
        // 問題を表示します
        let questionText = quizData[currentNum]["text"] as! String
        quizText.text = questionText
        
        // ナビゲーションタイトルを変更する
        self.navigationItem.title = "第\(currentNum + 1)問"
    }
    
    // ボタンの設定
    func changeButtonNum() {
        // 問題のボタンの数を取得
        let numberOfButton: Int = quizData[currentNum]["buttonNum"] as! Int
        
        // ボタンの数に合わせて調節
        switch numberOfButton {
        case 1:
            number2Button.isHidden = true
            number3Button.isHidden = true
            number4Button.isHidden = true
        case 2:
            number2Button.isHidden = false
            number3Button.isHidden = true
            number4Button.isHidden = true
        case 3:
            number2Button.isHidden = false
            number3Button.isHidden = false
            number4Button.isHidden = true
        case 4:
            number2Button.isHidden = false
            number3Button.isHidden = false
            number4Button.isHidden = false
        default:
            fatalError()
        }
    }
    
    // ボタンが押された時の処理
    func setupButtonAction() {
        number1Button.addTarget(self, action: #selector(buttonAction1), for: .touchUpInside)
        number2Button.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        number3Button.addTarget(self, action: #selector(buttonAction3), for: .touchUpInside)
        number4Button.addTarget(self, action: #selector(buttonAction4), for: .touchUpInside)
    }
    
    // ボタンのアクション設定
    @objc func buttonAction1() {
        checkAnswer(yourAnswer: 1)
    }
    @objc func buttonAction2() {
        checkAnswer(yourAnswer: 2)
    }
    @objc func buttonAction3() {
        checkAnswer(yourAnswer: 3)
    }
    @objc func buttonAction4() {
        checkAnswer(yourAnswer: 4)
    }
    
    // アラートの表示
    func showAlert(title: String, message: String, result: Bool, last: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if last {
            // 最後の問題の時
            
            // 答えの結果でアラートの内容を変える
            if result {
                // 正解した時のアラート
                
                // okボタン
                let close = UIAlertAction(title: "OK", style: .default) { (_) in
                    self.resultQuestion.append("⭕️")
                    
                    self.performSegue(withIdentifier: "toResult", sender: nil)

                    // 値をリセットする
                    self.currentNum = 0
                    self.resultQuestion = []
                    self.setupQuiz()
                    self.setupQuiz()
                }
                
                alert.addAction(close)
            } else {
                
                // 不正解の時のアラート
                
                // もう一度ボタン
                let again = UIAlertAction(title: "もう一度", style: .default) { (_) in
                    self.currentNum -= 1
                    self.setupQuiz()
                }
                
                // okボタン
                let close = UIAlertAction(title: "OK", style: .default) { (_) in
                    self.resultQuestion.append("❌")
                   
                    self.performSegue(withIdentifier: "toResult", sender: nil)
                    
                    // 値をリセットする
                    self.currentNum = 0
                    self.resultQuestion = []
                    self.setupQuiz()
                }
                alert.addAction(again)
                alert.addAction(close)
            }
          
        } else {
            // 最後の問題じゃない時
            
            // 答えの結果でアラートの内容を変える
            if result {
                // 正解した時のアラート

                // okボタン
                let close = UIAlertAction(title: "OK", style: .default) { (_) in
                    self.resultQuestion.append("⭕️")
                    self.setupQuiz()
                }
                
                alert.addAction(close)
            } else {
                // 不正解の時のアラート
                
                // もう一度ボタン
                let again = UIAlertAction(title: "もう一度", style: .default) { (_) in
                    self.currentNum -= 1
                    self.setupQuiz()
                }
                
                // okボタン
                let close = UIAlertAction(title: "OK", style: .default) { (_) in
                    self.resultQuestion.append("❌")
                    self.setupQuiz()
                }
                alert.addAction(again)
                alert.addAction(close)
            }
        }
        // アラートの表示
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
             // segueの識別子の確認
        if segue.identifier == "toResult" {
            // 次の画面を代入
            let nextVC = segue.destination as! ResultViewController
            // 値の受け渡し
            nextVC.questionNum = quizData.count
            nextVC.resultQuestion = resultQuestion
        }
    }
}

