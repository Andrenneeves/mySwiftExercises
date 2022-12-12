//
//  QuestoesViewController.swift
//  quizNigth
//
//  Created by user on 06/12/22.
//

import UIKit

class QuestoesViewController: UIViewController {
//Ligação dos botões com os elementos da nova view que vamos usar
    @IBOutlet weak var stackBotoes: UIStackView!
    @IBOutlet weak var dicaImg: UIImageView!
//Fim da ligação
    
    //Criando um array de string para colocar o nome das cidades
    var cities : [String] = ["Curitiba", "Toronto", "New York", "Washington"]
    //Criando um array de opçòes erradas
    var opcoes : [String] = ["Rio de janeiro", "Barueri", "São Gonçalo"]
    //Variavel pra guardar a opção certa
    var opcaocerta : Int!
    //Variável da pontuação para ir contando os acertos
    var pontuacao : Int = 0
    
    // Função para embaralhar
    func embaralhar (vetor : [String]) -> [String] {
        var vetorModificavel = vetor
        if vetor.count < 2 {return vetor}
        for i in 0 ..< vetor.count - 1 {
            let j = Int(arc4random_uniform(UInt32(vetor.endIndex - i))) + i
            if i != j {
                vetorModificavel.swapAt(i, j)
            }
        }
        return vetorModificavel
    }
   //FIM DA FUNÇÃO
    //Função para pegar as opções e escolher qual cidade vai ser carregada
    func carregaQuestoes() {
        //Caso não tenha cidade para carregar mais
        if (cities.count == 0){
            performSegue(withIdentifier: "fimDeJogo", sender: self)
            return
        }
        //Sorteando a imagem da cidade
        //precisa converter para INT para poder fazer arc4random
        let indice = Int(arc4random_uniform(UInt32(cities.count)))
        let cidade = cities [indice]
        // para não repetir as cidades
        cities.remove(at: indice)
        //Pegando os nomes das imagens, retirando os espaços entre os nomes compostos, transformando em minuscula e associando ao formato da imagem
        let imageName = cidade.replacingOccurrences(of: " ", with: "").lowercased() + ".jpg"
        // colcoando a imagem de dica
        dicaImg.image = UIImage(named: imageName)
        //Embaralhando e substituindo
        var minhasOpcoes = embaralhar(vetor: opcoes)
        //Acertando para verificar se as opçoes corretas estao entre as opcoes pra marcar
        for (indice, opcoes) in minhasOpcoes.enumerated(){
            if opcoes == cidade {
                opcaocerta = indice
                break
            }
        }
        // Verificando e colocando a opçào certa entre as 4 primeiras
        if opcaocerta >= 4 {
          let  novaOpcaoCerta = Int (arc4random_uniform(UInt32(4)))
            minhasOpcoes.swapAt(opcaocerta, novaOpcaoCerta)
            opcaocerta = novaOpcaoCerta
        }
        //Mudando os nomes dos botões para as opçoes
        var opcao = 0
        for view in stackBotoes.subviews {
            if let btn = view as? UIButton {
                btn.setTitle(minhasOpcoes[opcao], for: .normal)
                opcao += 1
            }
        }
    }
    // FIM DA FUNÇÃO
    
    
    //Função para chamar a função e não precisar repetir em cada botão
    func botao(_ num : Int){
        if num == opcaocerta {
            print("Acertou!")
            pontuacao += 1 // Aumentando a pontuação
        } else {
            print("Errou!")
            performSegue(withIdentifier: "fimDeJogo", sender: self)
        }
        carregaQuestoes()
    }
 
    // Ações para os botões
    //Botão 01
    @IBAction func botao1Click(_ sender: Any) {
        botao(0)
    }
    //Botão 02
    @IBAction func botao2Click(_ sender: Any) {
        botao(1)
    }
    //Botão 03
    @IBAction func botao3Click(_ sender: Any) {
        botao(2)
    }
    //Botão 04
    @IBAction func botao4Click(_ sender: Any) {
        botao(3)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Colocando as respostas certas dentro do array
        // A opção append coloca os elementos novos e tambem os elemntos que estão dentro de outro array com o contentsOf
        opcoes.append(contentsOf: cities)
        
        // Chamando a função
        carregaQuestoes()
    }
    
    // Função para enviar as informações daqui para a segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? gameOverViewController {
            //Colocando o valor na tela
            destino.pontuacao = self.pontuacao
        }
    }

}
