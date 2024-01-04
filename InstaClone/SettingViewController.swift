//
//  SettingViewController.swift
//  InstaClone
//
//  Created by Jerry Joy on 2024-01-03.
//

import UIKit
import Firebase

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutPressed(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
        }catch {
            print("error")
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }
        performSegue(withIdentifier: "toViewController", sender: nil)
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
