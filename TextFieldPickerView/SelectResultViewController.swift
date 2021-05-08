//
//  SelectResultViewController.swift
//  TextFieldPickerView
//
//  Created by YoNa on 2021/05/09.
//

import UIKit

class SelectResultViewController: UIViewController {

    // 値を受け取る用
    var selectArmedForce = [
        "force":""
    ]
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = selectArmedForce["force"]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
