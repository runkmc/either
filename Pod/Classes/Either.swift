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
}