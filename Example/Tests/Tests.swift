// https://github.com/Quick/Quick

import Quick
import Nimble
import Either

class EitherSpec: QuickSpec {
    
    struct User {
        let name: String
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
        }
    }
}
