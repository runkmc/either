public enum Either<T, U> {
    case Left(T)
    case Right(U)
    
    public static func isRight(item:Either<T, U>) -> Bool {
        if case .Right = item { return true }
        return false
    }

    public static func isLeft(item:Either<T, U>) -> Bool {
        return !isRight(item)
    }
    
    public static func lefts(items:[Either<T, U>]) -> [Either<T, U>] {
        return items.filter {isLeft($0) }
    }
    
    public static func rights(items:[Either<T, U>]) -> [Either<T, U>] {
        return items.filter {isRight($0) }
    }
    
    public func map<V>(@noescape f:U->V) -> Either<T, V> {
        switch self {
        case let .Right(x): return .Right(f(x))
        case let .Left(x):  return .Left(x)
        }
    }
    
    public func flatMap<V>(@noescape f:U->Either<T, V>) -> Either<T, V> {
        switch self {
        case let .Right(x): return f(x)
        case let .Left(x): return .Left(x)
        }
    }
}

infix operator >>- { associativity left }

public func >>-<T, U, V>(either:Either<T, U>, f:U->Either<T, V>) -> Either<T, V> {
    return either.flatMap(f)
}