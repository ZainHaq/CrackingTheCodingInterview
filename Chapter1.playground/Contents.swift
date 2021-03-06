// CHAPTER 1: Arrays and Strings
// By: Zain Haq

/* Tips and Tricks
    - HashMaps: Average O(1) lookup
    - When rotating be careful of ovveriding values
    - Don't be afraid to preprocess
    - Concatenating with self can sometimes be helpful
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

// MARK: - 1.4

extension String {
    
    // Approach: Use two hash maps to keep track of character counts
    //  and then compare hash maps.
    // Runtime: O(n) Average Case, O(n^2) Worst Case
    func isAnagramOf(_ string: String) -> Bool {
        guard self.characters.count == string.characters.count else {
            return false
        }
        
        var selfCharacterOccurences: [Character: Int] = [:]
        var otherCharacterOccurences: [Character: Int] = [:]
        
        self.characters.forEach { character in
            if let count = selfCharacterOccurences[character] {
                selfCharacterOccurences[character] = count + 1
            } else {
                selfCharacterOccurences[character] = 1
            }
        }
        
        string.characters.forEach { character in
            if let count = otherCharacterOccurences[character] {
                otherCharacterOccurences[character] = count + 1
            } else {
                otherCharacterOccurences[character] = 1
            }
        }
        
        return selfCharacterOccurences == otherCharacterOccurences
    }
    
}

assert("cat".isAnagramOf("tca") == true)
assert("catt".isAnagramOf("stac") == false)

// MARK: - 1.5

extension String {
    
    // Approach: Expand string length based on number of spaces and fill with 
    //  '%20'.
    // Runtime: O(n) Worst Case
    func replaceSpaces() -> String {
        let oldArray = Array(self.characters)
        var newArray: [Character] = []
        
        for char in oldArray {
            if char == " " {
                newArray.append("%")
                newArray.append("2")
                newArray.append("0")
            } else {
                newArray.append(char)

            }
        }
        
        return String(newArray)
    }
    
}

assert("Hello World".replaceSpaces() == "Hello%20World")
assert("Hello  World".replaceSpaces() == "Hello%20%20World")

// MARK: - 1.6

// Approach: Rotate starting from corner pieces and move inwards
// Runtime: O(n^2) Worst Case
func rotate(matrix: [[Int]]) -> [[Int]] {
    // since its an NxN matrix
    let n = matrix.count
    var rotatedMatrix: [[Int]] = matrix
    
    print(rotatedMatrix)
    
    for i in 0..<n/2 {
        for j in i..<n-1-i {
            let temp = rotatedMatrix[i][j]
            rotatedMatrix[i][j] = rotatedMatrix[n-1-j][i]
            rotatedMatrix[n-1-j][i] = rotatedMatrix[n-1-i][n-1-j]
            rotatedMatrix[n-1-i][n-1-j] = rotatedMatrix[j][n-1-i]
            rotatedMatrix[j][n-1-i] = temp
        }
    }
    
    return rotatedMatrix
}

let threeByThree = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

let fourByFour = [
    [1,2,3,4],
    [5,6,7,8],
    [9,10,11,12],
    [13,14,15,16]
]

rotate(matrix: threeByThree)
rotate(matrix: fourByFour)

// MARK: - 1.7

// Approach: Preprocess by finding locations with zeroes, and in the second pass
// replace corresponding rows and columns with zeroes
// Runtime: O(nm) Worst Case
func replaceRowsAndColsWithZeroes(matrix: [[Int]]) -> [[Int]] {
    
    var newMatrix = matrix
    let rowCount = matrix.count
    let colCount = matrix[0].count
    var rowsNeedsReplacement: [Bool] = Array(repeating: false, count: rowCount)
    var colsNeedsReplacement: [Bool] = Array(repeating: false, count: colCount)
    
    for i in 0..<rowCount {
        for j in 0..<colCount {
            if newMatrix[i][j] == 0 {
                rowsNeedsReplacement[i] = true
                colsNeedsReplacement[j] = true
            }
        }
    }
    
    for row in 0..<rowCount {
        for col in 0..<colCount {
            if rowsNeedsReplacement[row] || colsNeedsReplacement[col] {
                newMatrix[row][col] = 0
            }
        }
    }
    
    return newMatrix
}

let middleZero = [
    [1,2,3],
    [4,0,6],
    [7,8,9]
]

let completeReplace = [
    [0,2,3,10,11],
    [4,0,6,11,12],
    [7,8,0,12,13]
]

replaceRowsAndColsWithZeroes(matrix: middleZero)
replaceRowsAndColsWithZeroes(matrix: completeReplace)

// MARK :- 1.8

extension String {

    // Approach: Concatenate self with itsself and check if string is 
    // substring of the concatenated version.
    // Runtime: O(n) Worst Case
    func isRotationOf(string: String) -> Bool {
    
        let selfConcatenatedString = self + self
    
        return selfConcatenatedString.contains(string)
    }
}

assert("erbottlewat".isRotationOf(string: "waterbottle") == true)
assert("rebottlewat".isRotationOf(string: "waterbottle") == false)
assert("cattaco".isRotationOf(string: "tacocat") == true)





