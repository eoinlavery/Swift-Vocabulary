//
//  Word.swift
//  Swift Vocabulary
//
//  Created by Eoin Lavery on 24/07/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

struct VocabularyWord {
    let word: String
    let definition: String
    
    init(word: String, definition: String) {
        self.word = word
        self.definition = definition
    }
}
