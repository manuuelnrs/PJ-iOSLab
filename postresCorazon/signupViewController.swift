//
//  signup View Controller

import UIKit
import Firebase
import FirebaseDatabase

class signupViewController: UIViewController {
    private let database = Database.database().reference()

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var buttonCreate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? ViewController{
            destino.numberUser = numberTF.text ?? ""
        }
    }
    
    @IBAction func createAccountClicked(_ sender: UIButton) {
        guard let email = emailTF.text else { return }
        guard let password = passwordTF.text else { return }
        
        if (self.nameTF.text == "" || self.numberTF.text == ""){
            self.alerta()
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {
            firebaseResult, error in
            if let e = error {
                self.alerta()
            }
            else {
                // goto home
                self.performSegue(withIdentifier: "goToNext2", sender: self)
                
                // save info user
                let name = self.nameTF.text!
                let number = self.numberTF.text!
                
                let user: [String:String] = [
                    "Nombre":name,
                    "Telefono":number
                ]
                
                // Escritura de datos
                self.database.child(number).setValue(user)
                
            }
        }
        
        
    }//FinOutlet
    
    func alerta() -> Void {
        let alert = UIAlertController(title: "Error al registrar", message: "Datos incorrectos/incompletos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        self.present(alert, animated: true, completion: {return})
    }

    
    
}
