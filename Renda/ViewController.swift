//
//  ViewController.swift
//  Renda
//
//  Created by 金妍廷 on 2022/02/06.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    //変数の宣言
    //タップ数を表示するlabelの変数
    @IBOutlet var countLabel: UILabel!
    //タップボタンの変数
    @IBOutlet var tapButton: UIButton!
    //タップ数を数える変数
    var tapCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //ボタンを丸くする
        tapButton.layer.cornerRadius = 125
        
        // Firestoreのデータを読み込む
               firestore.collection("counts").document("share").addSnapshotListener { snapshot, error in
                   if error != nil {
                       print("エラーが発生しました")
                       print(error)
                       return
                   }
                   let data = snapshot?.data()
                   if data == nil {
                       print("データがありません")
                       return
                   }
                   let count = data!["count"] as? Int
                   if count == nil {
                       print("countという対応する値がありません")
                       return
                   }
                   self.tapCount = count!
                   self.countLabel.text = String(count!)
               }
        
    }
    
    
    // Firestoreを扱うためのプロパティ
    let firestore = Firestore.firestore()

    
    @IBAction func tapTapButton(){
        // タップを数える変数にプラス1する
        tapCount += 1
        // タップされた数をLabelに反映する
        countLabel.text = String(tapCount)
        // FirestoreにtapCountを書き込む
        firestore.collection("counts").document("share").setData(["count": tapCount])
    }


}

