//
//  BotaoComBorda.swift
//  quizNigth
//
//  Created by user on 29/11/22.
//

import UIKit

class BotaoComBorda: UIButton {

    override func awakeFromNib() {
        //Estou dizendo ainda execute as funcs do awakefromnib do UIbutton, mas execute essas coisas abaixo para mim.
        super.awakeFromNib()
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.red.cgColor
    }

}
