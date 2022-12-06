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
    
    //Função para pegar as opções e escolher qual cidade vai ser carregada
    func carregaQuestoes() {
        //Caso não tenha cidade para carregar mais
        if (cities.count == 0){
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
    }
    // FIM DA FUNÇÃO
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Chamando a função
        carregaQuestoes()
    }
    

}
