//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Eoin Lavery on 24/07/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    var vocabWords: [VocabularyWord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vocabWords = createData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabWords.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)

        let vocabWord = vocabWords[indexPath.row]
        
        cell.textLabel?.text = vocabWord.word

        return cell
    }
 

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "ShowDefinitionSegue" {
            
            guard let indexPath = tableView.indexPathForSelectedRow,
                let wordDetailVC = segue.destination as? DefinitionViewController else { return }
            
            let vocabWord = vocabWords[indexPath.row]
            wordDetailVC.vocabWord = vocabWord
        }
    }
 
    func createData() -> [VocabularyWord] {
        
        let variable = VocabularyWord(word: "Variable", definition: "Variables associate a name with a value of a particular type (such as the number 10 or the string 'Hello'). A variable can be changed during execution of an app.")
        
        let constant = VocabularyWord(word: "Constant", definition: "Constants are similar to variables, associating with a name and a value of a type. However, unlike variables. a constants value cannot be changed, and this helps with data integrity.")
        
        let function = VocabularyWord(word: "Function", definition: "Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed.")
        
        return [variable, constant, function]
    }

}
