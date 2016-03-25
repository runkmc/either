// https://github.com/Quick/Quick

import Quick
import Nimble
import Either

class EitherSpec: QuickSpec {
    
    struct User {
        let name: String
    }
    
    static func flatMapTest(str:String) -> Either<String, [String]> {
        return .Right([str, "and another string"])
    }
    
    override func spec() {
        describe("The Either type") {
            let testUser = User(name: "Montgomery Scott")
            
            it("provides isLeft and isRight") {
                let user: Either<String, User> = .Right(testUser)
                let failure: Either<String, User> = .Left("No such user")
                
                expect(Either.isRight(user)) == true
                expect(Either.isLeft(user)) == false
                expect(Either.isRight(failure)) == false
                expect(Either.isLeft(failure)) == true
            }
            
            it("provides lefts and rights") {
                let user1: Either<String, String> = .Right("James Kirk")
                let user2: Either<String, String> = .Right("William Riker")
                let failure: Either<String, String> = .Left("No such user")
                let list: [Either<String, String>] = [user1, user2, failure]
                
                expect(Either.rights(list)).to(haveCount(2))
                expect(Either.lefts(list)).to(haveCount(1))
                
                switch (Either.rights(list)[0]) {
                case let (.Right(value)) : expect(value) == "James Kirk"
                default: fatalError()
                }
                
                switch (Either.rights(list)[1]) {
                case let (.Right(value)) : expect(value) == "William Riker"
                default: fatalError()
                }
                
                switch (Either.lefts(list)[0]) {
                case let (.Left(value)) : expect(value) == "No such user"
                default: fatalError()
                }
            }
            
            it("maps Right values") {
                let data: Either<String, String> = .Right("James Kirk")
                let result = data.map { name in User.init(name: name) }
                
                switch(result) {
                case let .Right(user): expect(user.name) == "James Kirk"
                default: fatalError()
                }
            }
            
            it("leaves left values alone during map") {
                let data: Either<String, String> = .Left("a terrible error")
                let result = data.map { n in Int(n)! }
                
                switch(result) {
                case let .Left(x): expect(x) == "a terrible error"
                default: fatalError()
                }
            }
            
            it("flatMaps right values") {
                let e: Either<String, String> = .Right("whatever")
                let result = e.flatMap(EitherSpec.flatMapTest)
                
                switch result {
                case let .Right(arr): expect(arr) == ["whatever", "and another string"]
                default: fatalError()
                }
            }
        }
    }
}
