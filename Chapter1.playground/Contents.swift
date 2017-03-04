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




