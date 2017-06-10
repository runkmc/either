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

}
