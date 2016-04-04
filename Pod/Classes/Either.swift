public enum Either<T, U> {
    case Left(T)
    case Right(U)
    
    /// Returns true if the Either contains a Right value,
    /// false if it is left.
    public static func isRight(item:Either<T, U>) -> Bool {
        if case .Right = item { return true }
        return false
    }

    /// The inverse of isRight.
    public static func isLeft(item:Either<T, U>) -> Bool {
        return !isRight(item)
    }
    
    /// Filters out the rights in an array of Eithers, returning just the lefts.
    public static func lefts(items:[Either<T, U>]) -> [Either<T, U>] {
        return items.filter {isLeft($0) }
    }
    
    /// The inverse of lefts.
    public static func rights(items:[Either<T, U>]) -> [Either<T, U>] {
        return items.filter {isRight($0) }
    }
    
    /// Applies a function to a Right value and returns another Either containing
    /// the result. Left values are returned untouched.
    public func map<V>(@noescape f:U->V) -> Either<T, V> {
        switch self {
        case let .Right(x): return .Right(f(x))
        case let .Left(x):  return .Left(x)
        }
    }
    
    /// Similar to map, but takes a function that takes a Either value.
    public func flatMap<V>(@noescape f:U->Either<T, V>) -> Either<T, V> {
        switch self {
        case let .Right(x): return f(x)
        case let .Left(x): return .Left(x)
        }
    }
}

/// An alternate form of flatMap.
infix operator >>- { associativity left }

public func >>-<T, U, V>(either:Either<T, U>, f:U->Either<T, V>) -> Either<T, V> {
    return either.flatMap(f)
}