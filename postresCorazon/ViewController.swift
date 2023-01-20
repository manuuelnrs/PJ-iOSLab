//  Login View Controller

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    private let database = Database.database().reference()
    
    var numberUser: String = ""
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //----------
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? tbViewController{
            destino.numberUser = numberUser
        }
    }
    
    
    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = emailTF.text else { return }
        guard let password = passwordTF.text else { return }
        
        
        Auth.auth().signIn(withEmail: email, password: password) {
            firebaseResult, error in
            if let e = error {
                let alert = UIAlertController(title: "Error al ingresar", message: "Datos incorrectos/incompletos", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                self.present(alert, animated: true, completion: {return})
            }
            else {
                // goto home
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
    }
    
}

