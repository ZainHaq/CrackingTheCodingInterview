// CHAPTER 1: Arrays and Strings
// By: Zain Haq

/* Tips and Tricks
    - HashMaps: Average O(1) lookup
 
*/

import Foundation

// MARK: - 1.1

extension String {
    
    // Approach: Keep track of whether an element has occured or not
    //  if it has occured previously, then its a duplicate
    // Runtime: O(n) Average Case, O(n^2) Worst Case
    func hasUniqueCharacters() -> Bool {
        var characterOccurences: [Character: Bool] = [:]
        var hasUniqueChars: Bool = true
        
        self.characters.forEach { character in
            if characterOccurences[character] != nil {
                hasUniqueChars = false
            } else {
                characterOccurences[character] = true
            }
        }
        
        return hasUniqueChars
    }
    
    // Approach: Compare each element of array with every other element to
    //  find duplicates
    // Runtime: O(n^2) Worst Case
    func hasUniqueCharactersWithoutAdditionalDataStructures() -> Bool {
        
        let charactersArray = Array(self.characters)
        let charactersCount = self.characters.count
        let charactersRange = 0..<charactersCount
        
        for i in charactersRange {
            for j in charactersRange {
                if charactersArray[i] == charactersArray[j] && i != j {
                    return false
                }
            }
        }
        return true
    }
    
}

assert("Cat".hasUniqueCharacters() == true)
assert("Doggo".hasUniqueCharacters() == false)
assert("Cat".hasUniqueCharactersWithoutAdditionalDataStructures() == true)
assert("Doggo".hasUniqueCharactersWithoutAdditionalDataStructures() == false)

// MARK: - 1.2

extension String {
    
    // Approach: Determine size of string and then reverse in traditional way.
    //  Obviosuly you could use the built in reverse/length function but that is not
    //  in the spirit of the question.
    // Runtime: O(n) Worst Case
    func cStyleReverse() -> String {
        let nullTerminator: Character = "⍬"
        var cStyleArray = self + String(nullTerminator)
        var charctersArray = Array(cStyleArray.characters)
        var index = 0
        
        while ( charctersArray[index] != nullTerminator) {
            index += 1
        }
        
        // since we dont care about nullTerminator
        let halfCharacterRange = 0..<(index-1)/2
        
        for charIndex in halfCharacterRange {
            let tempSwapVar = charctersArray[charIndex]
            charctersArray[charIndex] = charctersArray[index - charIndex - 1]
            charctersArray[index - charIndex - 1] = tempSwapVar
        }
        
        // dont care about nullTerminator
        return String(charctersArray.dropLast())
        
    }
}

assert("Cat".cStyleReverse() == "taC")
assert("Dog".cStyleReverse() == "goD")

// MARK: - 1.3

extension String {
    
    // Approach: Similar approach as determining if the string has 
    //  unique characters
    // Runtime: O(n) Average Case, O(n^2) Worst Case
    func removeDuplicates() -> String {
        
        var characterOccurences: [Character: Bool] = [:]
        var charactersArray = Array(self.characters)
        let charactersRange = 0..<charactersArray.count
        
        for charIndex in charactersRange {
            let currentCharacter = charactersArray[charIndex]
            if characterOccurences[currentCharacter] != nil {
                // replace duplicate with null terminator
                charactersArray[charIndex] = "\0"
            } else {
                characterOccurences[currentCharacter] = true
            }
        }
        
        return String(charactersArray).replacingOccurrences(of: "\0", with: "")
        
    }
    
}

assert("CCCCCCCaaaaaaatttttt".removeDuplicates() == "Cat")
assert("DDDDoooooggggg".removeDuplicates() == "Dog")



