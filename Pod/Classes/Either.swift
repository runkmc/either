

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
}

