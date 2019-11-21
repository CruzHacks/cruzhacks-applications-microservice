const recordExist = require("../../RequestTrigger/dbConnection/recordExist").recordExist
jest.mock("knex")

describe("Unit Testing for RecordExists Function, which is main GET function", () => {

    test("Expecting an empty data set for an invalid entry", () => {
        const randomEmail = "example@test.com";
        const type = "hacker";
        recordExist(type, randomEmail).then(response => {
            expect(response).toBeNull();
        }); 
    });

});