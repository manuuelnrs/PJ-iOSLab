
import UIKit
import FirebaseDatabase

class PedidoViewController: UIViewController {

    var numberUser: String = ""
    private let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var dom1: UITextField!
    @IBOutlet weak var dom2: UITextField!
    @IBOutlet weak var dom3: UITextField!
    @IBOutlet weak var dom4: UITextField!
    
    @IBAction func pedidoClicked(_ sender: Any) {
        if (self.dom1.text == "" || self.dom2.text == "" || self.dom3.text == "" ){
            let alert = UIAlertController(title: "Error de Domicilio", message: "Datos incorrectos/incompletos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: {return})
            return
        }
        else {
            // Default
            if(numberUser == ""){
                numberUser = "12345"
            }
            
            // Lectura de datos Firebase DB Realtime
            self.database.child(numberUser).getData(completion:  { error, snapshot in
              guard error == nil else {
                print(error!.localizedDescription)
                return;
              }
                let value = snapshot?.value as? NSDictionary
                let username = value?["Nombre"] as? String ?? ""
                // Go next VC
                self.performSegue(withIdentifier: "goToNext3", sender: self)
                let pedido = UIAlertController(title: "Pedido satisfactorio", message: "Sr(a)."+username+" su pedido llegará pronto.", preferredStyle: .alert)
                pedido.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                self.present(pedido, animated: true, completion: {return})
                return
            });
        }
    }


}
