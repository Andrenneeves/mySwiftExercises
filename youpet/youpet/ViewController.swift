import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    //Armazenando login e senha
    var login : [String?] = ["Administrador@brq.com"]
    var password : [String?] = ["admin1234"]
    
    //Fazendo caixa de texto do usuário
    let userName: UITextField = UITextField(frame: CGRect(x: 40, y:150, width: 300.00, height: 30.00))
    // Fazendo a caixa de senha
    let userPassword: UITextField = UITextField(frame: CGRect(x: 40, y:210, width: 300.00, height: 30.00))
    //Fazendo as labels
    let myLbl: UILabel = UILabel(frame: CGRect(x: 160, y: 70, width: 250, height: 50))
    let myLblName: UILabel = UILabel(frame: CGRect(x: 45, y: 113, width: 250, height: 50))
    let myLblName2: UILabel = UILabel(frame: CGRect(x: 45, y: 175, width: 250, height: 50))
    let myLblNewPass: UILabel = UILabel(frame: CGRect(x: 45, y: 227, width: 250, height: 50))
    let myLblForgot: UILabel = UILabel(frame: CGRect(x: 45, y: 247, width: 250, height: 50))
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.userName.delegate = self
       self.userPassword.delegate = self
        
        //Fazendo o button - atributos
        let myLoginButton = UIButton(frame: CGRect(x: 140, y: 300, width: 100, height: 50))
        myLoginButton.backgroundColor = .darkGray;
        myLoginButton.layer.cornerRadius = 10
        myLoginButton.setTitle("Entrar", for: .normal)
        myLoginButton.setTitleColor(.white, for: .normal)
        
        //Ação do botão
        myLoginButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        //Colocando o botão para aparecer
        self.view.addSubview(myLoginButton)
        
        //inicializando a func que dá as características dos textfields
        textBox()
    }//FIM DA VIEWDIDLOAD
    
    //Func para o botão funcionar
    @objc func buttonAction(sender: UIButton){
        if userName.text?.isEmpty == true {
            //Fazendo o Alert
            let alert: UIAlertController = UIAlertController(title: "Alerta", message: "Campo vazio, Favor verificar", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel){
                (action) in
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        if userPassword.text?.isEmpty == true {
            let alert: UIAlertController = UIAlertController(title: "Alerta", message: "Campo vazio, Favor verificar", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel){
                (action) in
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            print("clicou")
        }
        if userName.text == "Administrador@brq.com" && userPassword.text == "admin1234" {
            let alert: UIAlertController = UIAlertController(title: "Alerta", message: "Bem vindo Sr. Stark", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel){
                (action) in
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            print("Login bem sucedido")
        }
        
        else{
            let alert: UIAlertController = UIAlertController(title: "Alerta", message: "Senha Incorreta, favor verificar", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel){
                (action) in
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            print("Login mal sucedido")
            return
        }
       // alert.addAction(action)
        //self.present(alert, animated: true, completion: nil)
        
    }//Fim func
    
    //Configurando o enter do teclado do simuldor
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.userName {
            self.userPassword.becomeFirstResponder()
        } else {
            self.userPassword.resignFirstResponder()
        }
        return true
    }//Fim da Func
    
    //Func para configurações do text field
    func textBox(){
        //Labels
        myLblName.text = "Login:"
        myLblName2.text = "Senha:"
        myLblNewPass.text = "Criar Cadastro"
        myLblForgot.text = "Esqueci a senha"
        //placeholder
        userName.placeholder = "Nome de usuário"
        userPassword.placeholder = "Digite a senha"
        userPassword.isSecureTextEntry = true
        //Configuração Label
        myLbl.text = "Conectar"
        //Estilo da borda
        userName.borderStyle = UITextField.BorderStyle.line
        userPassword.borderStyle = UITextField.BorderStyle.line
        //Cor de fundo
        userName.backgroundColor = UIColor.white
        userPassword.backgroundColor = UIColor.white
        
        //Código pra poder aparecer na tela
        self.view.addSubview(userName)
        self.view.addSubview(userPassword)
        self.view.addSubview(myLbl)
        self.view.addSubview(myLblName)
        self.view.addSubview(myLblName2)
        self.view.addSubview(myLblNewPass)
        self.view.addSubview(myLblForgot)
    }//Fim da Func


}

