//
//  ViewController.swift
//  TextFieldPickerView
//
//  Created by YoNa on 2021/05/08.
//

import UIKit

class ViewController: UIViewController {

    var armedForce = ["Army" , "Marine" , "Navy" , "Air Force" , "Coast Guard" , "Space Command"]
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var outputButton: UIButton!
    
    var  pickerView = UIPickerView()
    
    // 結果画面に送る用のもの
    var selectArmedForce = [
        "force":""
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 戻る非表示
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // PickerView生成
        createPickerView()
        // 出力ボタン無効化
        outputButton.isEnabled = false
        outputButton.layer.backgroundColor = UIColor.gray.cgColor
        
        
    }
    // MARK:-pickerView関連
    func createPickerView()  {
        pickerView.delegate = self
        // UITextField が持つ inputView に pickerView を設定
        textField.inputView = pickerView
        // ツールバー
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        // 完了ボタン
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.donePicker))
        toolbar.setItems([doneButtonItem], animated: true)
        textField.inputAccessoryView = toolbar
    }
    // 完了ボタンでキーボードを閉じる
    @objc func donePicker() {
        textField.endEditing(true)
        outputButton.isEnabled = true
        outputButton.layer.backgroundColor = UIColor.green.cgColor
    }
    // キーボード以外タップでキーボード閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.endEditing(true)
    }
    // MARK:- 出力関連
    @IBAction func tapButton(_ sender: Any) {
        // 送る用のものに格納
        selectArmedForce["force"] = textField.text!
        let selectResultViewController = self.storyboard?.instantiateViewController(withIdentifier: "SelectResultViewController") as! SelectResultViewController
        // 検索結果情報を遷移画面へ渡す
        selectResultViewController.selectArmedForce = self.selectArmedForce
        // 検索した事柄を遷移画面へ渡す
        // レストラン一覧画面へ遷移
        self.navigationController?.pushViewController(selectResultViewController, animated: true)
    }
    
}


// MARK:-pickerView関連
extension ViewController : UIPickerViewDelegate,UIPickerViewDataSource {
    
    // pickerView に表示する列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // pickerView に表示するデータの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return armedForce.count
    }
    // pickerView に設定するデータを登録するための
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return armedForce[row]
    }
    // pickerView の各種データを選択したときに呼ばれる
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = armedForce[row]
        resultLabel.text = armedForce[row]
    }

}
