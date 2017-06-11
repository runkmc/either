//
//  Either.swift
//  Either
//
//  Created by Kevin McGladdery on 6/6/17.
//  Copyright © 2017 Kevin McGladdery. All rights reserved.
//

import Foundation

public enum Either<T, U> {
    /// One of two possible values for the Either type
    case left(T)
    /// One of two possible values for the Either type
    case right(U)
    
    /// Returns true if the Either contains a Right value,
    /// false if it is left.
    public static func isRight(_ item:Either<T, U>) -> Bool {
        if case .right = item { return true }
        return false
    }
    
    /// The inverse of isRight.
    public static func isLeft(_ item:Either<T, U>) -> Bool {
        return !isRight(item)
    }
    
    /// Filters out the rights in an array of Eithers, returning just the lefts.
    public static func lefts(_ items:[Either<T, U>]) -> [Either<T, U>] {
        return items.filter {isLeft($0) }
    }
    
    /// The inverse of lefts.
    public static func rights(_ items:[Either<T, U>]) -> [Either<T, U>] {
        return items.filter {isRight($0) }
    }
    
    /// Provides the value of a right type
    public func rightValue() -> U? {
        switch self {
        case .right(let value): return value
        default: return nil
        }
    }
    
    /// Provides the value of a left type
    public func leftValue() -> T? {
        switch self {
        case .left(let value): return value
        default: return nil
        }
    }
    
    /// Applies a function to a Right value and returns another Either containing
    /// the result. Left values are returned untouched.
    public func map<V>(f: (U)->V) -> Either<T, V> {
        switch self {
        case let .right(x): return .right(f(x))
        case let .left(x):  return .left(x)
        }
    }

}
