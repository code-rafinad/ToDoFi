//
//  ViewController.swift
//  ToDoFi
//
//  Created by Сахар Кубический on 02.05.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var warnLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        warnLabel.alpha = 0
    
    }
    
    func kbDidShow(notification: Notification) {
        
    }

    func kbDidHide() {
        
    }
    
    func displayWarningLabel(withText text: String) {
        warnLabel.text = text
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in self?.warnLabel.alpha = 1 }) { [weak self] complete in
            self?.warnLabel.alpha = 0
        }
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] (user, error) in
            if error != nil {
                self?.displayWarningLabel(withText: "Error occured")
                print(email)
                print(error?.localizedDescription ?? "default_error")
                return
            }
            if user != nil {
                self?.performSegue(withIdentifier: "tasksSegue", sender: nil)
                return
            }
            self?.displayWarningLabel(withText: "No such user")
        })
    }
    @IBAction func registerTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }
            Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] (user,error) in
        if error == nil {
            print("created_user")
            if user != nil {
                self?.performSegue(withIdentifier: "tasksSegue", sender: nil)
            }
        }
        })
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

