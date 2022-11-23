

import UIKit




class ViewController: UIViewController {

    var labelInfo: String = "Bom dia, seja bem vindo"
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var labelText2: UILabel!
    
    
    override func viewDidLoad() { //Onde chamamos as funções
        super.viewDidLoad()
        
        labelText.text = morningMessage()
        buttonText.setTitle( "Não clique aqui", for: .normal)
        
        labelText2info(tempo: false)
        
        // Imprimir 0 - 10
       /*for number in 1...10{
            print (number)
        }*/
       
        //Print pares e guarde ímpares
       
       
        
        for numero in 1...10 {
            if numero % 2 == 0 {
                print(numero)
            };
            for numeroImpar in 1...10 {
                if numeroImpar % 2 != 0{
                    var numeroImpar: [Int] = [numeroImpar]
                    print(numeroImpar)
                }
                
            }
          
        }

       }// Fim do ViewDidLoad
    
    
    
    func morningMessage() -> String { // Preciso informar que a func vai retornar uma String
        return labelInfo
        }
    
    
    func labelText2info(tempo: Bool){
        
        if tempo == true {
            labelText2.text = "BOM DIA"
        } else {
            labelText2.text = "BOA NOITE"
        }
    }

}//Fim do Viewcontroller

