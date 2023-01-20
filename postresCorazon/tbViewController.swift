import UIKit

class tbViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var numberUser: String = ""
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(postres[indexPath.row]) // Touch
        self.performSegue(withIdentifier: "goToPedido", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? PedidoViewController{
            destino.numberUser = numberUser
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.label.text = postres[indexPath.row]
        cell.img.image = UIImage(named: imagenes[indexPath.row])
        
        cell.img.layer.cornerRadius = cell.img.frame.height / 10
        
        return cell
    }
    

    
    @IBOutlet weak var tbView: UITableView!
    
    let postres = ["Crepas de fresa                      $75", "Crepas Ferrero                      $85", "Crepas de cajeta                  $95","Helados Napolitano     $125","Pastel Especial            $360"]
    let imagenes = ["crepas","crepas2","crepas3","helados","pastel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbView.delegate = self
        tbView.dataSource = self
    }
    

}
