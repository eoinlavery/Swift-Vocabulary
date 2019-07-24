//
//  CategoriesTableViewController.swift
//  Swift Vocabulary
//
//  Created by Eoin Lavery on 24/07/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryItemsLabel: UILabel!
    
}

class CategoriesTableViewController: UITableViewController {
    
    var categoryArray: [VocabularyCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryArray.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else { return UITableViewCell()}

        let category = categoryArray[indexPath.row]
        
        cell.categoryTitleLabel.text = category.name
        cell.categoryItemsLabel.text = ("\(category.vocabWords.count) items")
        
        return cell
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CategoryDetailSegue" {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let wordsVC = segue.destination as? WordsTableViewController else { return }
            
            let vocabWords: [VocabularyWord] = categoryArray[indexPath.row].vocabWords
            wordsVC.vocabWords = vocabWords
            wordsVC.title = categoryArray[indexPath.row].name
        }
    }
    

    
    func createData() {
        
        //Setup Categories
        var basics = VocabularyCategory(name: "The Basics", vocabWords: [])
        var basicOperators = VocabularyCategory(name: "Basic Operators", vocabWords: [])
        var stringsAndChars = VocabularyCategory(name: "Strings and Characters", vocabWords: [])
        var collectionTypes = VocabularyCategory(name: "Collection Types", vocabWords: [])
        
        //Set basics Category data
        let properties = VocabularyWord(word: "Constants and Variables", definition: "Constants and variables associate a name (such as maximumNumberOfLoginAttempts or welcomeMessage) with a value of a particular type (such as the number 10 or the string 'Hello'). The value of a constant can’t be changed once it’s set, whereas a variable can be set to a different value in the future.")
            basics.vocabWords.append(properties)
        
        let comments = VocabularyWord(word: "Comments", definition: "Use comments to include nonexecutable text in your code, as a note or reminder to yourself. Comments are ignored by the Swift compiler when your code is compiled.")
            basics.vocabWords.append(comments)
        
        let integers = VocabularyWord(word: "Integers", definition: "Integers are whole numbers with no fractional component, such as 42 and -23. Integers are either signed (positive, zero, or negative) or unsigned (positive or zero).")
            basics.vocabWords.append(integers)
        
        let boolean = VocabularyWord(word: "Booleans", definition: "Swift has a basic Boolean type, called Bool. Boolean values are referred to as logical, because they can only ever be true or false. Swift provides two Boolean constant values, true and false")
            basics.vocabWords.append(boolean)
        
        let optionals = VocabularyWord(word: "Optionals", definition: "You use optionals in situations where a value may be absent. An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all.")
            basics.vocabWords.append(optionals)
        
        //Set basicOperators category data
        let assignmentOp = VocabularyWord(word: "Assignment Operator", definition: "The assignment operator (a = b) initializes or updates the value of a with the value of b. If the right side of the assignment is a tuple with multiple values, its elements can be decomposed into multiple constants or variables at once. Unlike the assignment operator in C and Objective-C, the assignment operator in Swift does not itself return a value. The following statement is not valid")
            basicOperators.vocabWords.append(assignmentOp)
        
        let arithmeticOp = VocabularyWord(word: "Arithmetic Operators", definition: "Swift supports the four standard arithmetic operators for all number types: Addition (+), Subtraction (-), Multiplication (*), Division (/)")
            basicOperators.vocabWords.append(arithmeticOp)
        
        let remainderOp = VocabularyWord(word: "Remainder Operator", definition: "The remainder operator (a % b) works out how many multiples of b will fit inside a and returns the value that is left over (known as the remainder).")
            basicOperators.vocabWords.append(remainderOp)
        
        let compAssignOp = VocabularyWord(word: "Compound Assigment Operators", definition: "Like C, Swift provides compound assignment operators that combine assignment (=) with another operation. One example is the addition assignment operator (+=)")
            basicOperators.vocabWords.append(compAssignOp)
        
        let comparisonOp = VocabularyWord(word: "Comparison Operators", definition: "Swift supports all standard C comparison operators: Equal to (a == b), Not equal to (a != b), Greater than (a > b), Less than (a < b), Greater than or equal to (a >= b), Less than or equal to (a <= b)")
            basicOperators.vocabWords.append(comparisonOp)
        
        //Set stringsAndChars category data
        let stringLiterals = VocabularyWord(word: "String Literals", definition: "You can include predefined String values within your code as string literals. A string literal is a sequence of characters surrounded by double quotation marks ('').")
            stringsAndChars.vocabWords.append(stringLiterals)
        
        let stringMutability = VocabularyWord(word: "String Mutability", definition: "You indicate whether a particular String can be modified (or mutated) by assigning it to a variable (in which case it can be modified), or to a constant (in which case it can’t be modified)")
            stringsAndChars.vocabWords.append(stringMutability)
        
        let stringInterpolation = VocabularyWord(word: "String Interpolation", definition: "String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal. You can use string interpolation in both single-line and multiline string literals. Each item that you insert into the string literal is wrapped in a pair of parentheses, prefixed by a backslash.")
            stringsAndChars.vocabWords.append(stringInterpolation)
        
        let unicode = VocabularyWord(word: "Unicode", definition: "Unicode is an international standard for encoding, representing, and processing text in different writing systems. It enables you to represent almost any character from any language in a standardized form, and to read and write those characters to and from an external source such as a text file or web page. Swift’s String and Character types are fully Unicode-compliant, as described in this section.")
            stringsAndChars.vocabWords.append(unicode)
        
        //Set collectionTypes category data
        let arrays = VocabularyWord(word: "Arrays", definition: "An array stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.")
            collectionTypes.vocabWords.append(arrays)
        
        let dictionaries = VocabularyWord(word: "Dictionaries", definition: "A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary. Unlike items in an array, items in a dictionary do not have a specified order. You use a dictionary when you need to look up values based on their identifier, in much the same way that a real-world dictionary is used to look up the definition for a particular word.")
            collectionTypes.vocabWords.append(dictionaries)

        categoryArray.append(basics)
        categoryArray.append(basicOperators)
        categoryArray.append(stringsAndChars)
        categoryArray.append(collectionTypes)
    }
}
