//
//  Array+extensions.swift
//  SOExtensions
//
//  Created by Sebastian Osiński on 17.12.2015.
//
//

public extension Array {
    
    /**
     Return an Array containing all subarrays of `self`.
     */
    public func allSubarrays() -> [[Element]] {
        let noOfSubarrays: UInt = 1 << UInt(self.count)
        var subarrays = [[Element]]()
        
        for i in 0..<noOfSubarrays {
            let subarray = self.filterByIndex { (i >> UInt($0)) % 2 == 1 }
            subarrays.append(subarray)
        }
        
        return subarrays
    }
    
    /**
     Return an Array containing all permutations of `self`.
     */
    public func permutations() -> [[Element]] {
        guard self.count > 0 else {
            return [[]]
        }
        
        var results = [[Element]]()
        
        for i in 0..<self.count {
            var copy = self
            let element = copy.removeAtIndex(i)
            let subPermutations = copy.permutations()
            
            for var subPermutation in subPermutations {
                subPermutation.insert(element, atIndex: 0)
                results.append(subPermutation)
            }
        }
        
        return results
    }
    
    /**
     Check if any of array's elements satisfies given predicate.
     
     - returns: True if any of the elements satisfies the predicate, false otherwise.
     */
    public func any(@noescape predicate: (Element) throws -> Bool) rethrows -> Bool {
        for element in self {
            if try predicate(element) {
                return true
            }
        }
        return false
    }
    
    /**
     Return an Array containing the elements of self, in order, whom indices satisfy the predicate includeElement.
     */
    public func filterByIndex(@noescape includeElement: (Int) throws -> Bool) rethrows -> [Array.Generator.Element] {
        return try self.enumerate().filter { try includeElement($0.index) }.map { $0.element }
    }
    
}