//
//  DefinitionViewController.swift
//  Swift Vocabulary
//
//  Created by Eoin Lavery on 24/07/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    @IBOutlet weak var colorCellLabel: UILabel!
    @IBOutlet weak var colorCellTextField: UITextView!
    
    var vocabWord: VocabularyWord?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        
        if let vocabWord = vocabWord {
            
            title = vocabWord.word
            colorCellLabel.text = vocabWord.word
            colorCellTextField.text = vocabWord.definition
        }
    }
    
}
