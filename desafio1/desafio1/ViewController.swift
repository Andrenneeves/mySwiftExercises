// desafio1 - Contador
//  Text field
// Apenas números
//Botão Start - Pausa
//Botão limpar
//Label com o contador ou print no console ou os dois
// printar só os pares
//Sem for

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // Text, Label e Buttons
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var contadorLabel: UILabel!
    
    // Armazenando o valor do textField no array e declarando o array como inteiro
    var textFieldArray : [Int] = []
     
    //tentando converter o valor do text field pra int
    var textFieldValue : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }
    
    // INICIO DA FUNÇÃO PARA RECCEBER SÓ NÚMEROS
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textField {
            let allowedcharacters = "0123456789"
            let allowedcharactersSet = CharacterSet(charactersIn: allowedcharacters)
            let typedCharactersSetIn = CharacterSet(charactersIn: string)
            let numbers = allowedcharactersSet.isSuperset(of: typedCharactersSetIn)
            return numbers
        }
        return true
    }//FIM DA FUNC
    
    
    //INICIO DO BUTTON INICIAR
    @IBAction func iniciobutton(_ sender: Any) {
       //Mostrando que o valor da variável textFieldValue que é um array, recebe o valor do textField.
        textFieldValue = (textField.text! as NSString).integerValue
        
        //Laço de repetição
        while textFieldValue > 0 {
            
            textFieldValue -= 1
            print(textFieldValue)
            // Mostrar os pares
            if textFieldValue % 2 == 0 {
                //Adicionando valor no array toda vez que a func dá uma volta
                textFieldArray.append(textFieldValue)
            }
        }
        
        print(textFieldArray)
        
        
        //var textFieldArray = Int(contadorLabel.text!) ?? 0
        //textFieldArray += textFieldArray
        contadorLabel.text = "\(textFieldArray)"
        
        
        
        
        
            //var arrayText: [Any?] = [textFieldArray]
            //let arrayText = String(textFieldArray)
            //UILabel não recebeu o inteiro, preciso converter para String.
           //contadorLabel.text = String(textFieldArray)
           //textFieldArray = contadorLabel
            //Printando os pares
            //print(textFieldArray)
           //var textFieldArray : String = ""
            //contadorLabel.text = textFieldArray
        
        
     }// FIM DA FUNC
    
        // Func para zerar o input no textField.
        @IBAction func zerButton2(_ sender: Any) {
            textField.text = ""
        }// FIM DA FUNC
}


