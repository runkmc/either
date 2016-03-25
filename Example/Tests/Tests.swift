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
                let user1: Either<String, User> = .Right(testUser)
                let user2: Either<String, User> = .Right(testUser)
                let failure: Either<String, User> = .Left("No such user")
                let list: [Either<String, User>] = [user1, user2, failure]
                
                expect(Either.rights(list)).to(haveCount(2))
                expect(Either.lefts(list)).to(haveCount(1))
            }
        }
    }
}
