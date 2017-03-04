// CHAPTER 1: Arrays and Strings
// By: Zain Haq

/* Tips and Tricks
    - HashMaps: Average O(1) lookup
 
*/

// MARK: - 1.1

extension String {
    
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
    
    func hasUniqueCharactersWithoutAdditionalDataStructures() -> Bool {
        
    }
    
}


