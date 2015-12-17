//
//  Array+extensions.swift
//  SOExtensions
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Sebastian Osiński
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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