//
//  gameOverViewController.swift
//  quizNigth
//
//  Created by user on 12/12/22.
//

import UIKit

class gameOverViewController: UIViewController {

//Label onde vai aparecer a pontuaçao
    @IBOutlet weak var pontuacaoLabel: UILabel!
    
    //Variável de valor
    var pontuacao : Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        //Jogando a pontuação na Label e convertendo em string com \()
        pontuacaoLabel.text = "\(pontuacao)"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
