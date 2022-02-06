//
//  ViewController.swift
//  Renda
//
//  Created by 金妍廷 on 2022/02/06.
//

import UIKit

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
        
    }
    
    
    @IBAction func tapTapButton(){
        tapCount = tapCount + 1
        countLabel.text = String(tapCount)
    }


}

