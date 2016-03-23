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
                
                expect(isRight(user)) == true
                expect(isLeft(user)) == false
                expect(isRight(failure)) == false
                expect(isRight(failure)) == false
            }

        }
    }
}
