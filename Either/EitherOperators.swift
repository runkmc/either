//
//  EitherOperators.swift
//  Either
//
//  Created by Kevin McGladdery on 6/11/17.
//  Copyright © 2017 Kevin McGladdery. All rights reserved.
//

import Foundation

precedencegroup EitherPrecedenceLeft {
    associativity: left
    lowerThan: LogicalDisjunctionPrecedence
    higherThan: AssignmentPrecedence
}

infix operator >>- : EitherPrecedenceLeft

/// An alternate form of flatMap.
public func >>-<T, U, V>(either:Either<T, U>, f:(U)->Either<T, V>) -> Either<T, V> {
    return either.flatMap(f)
}
