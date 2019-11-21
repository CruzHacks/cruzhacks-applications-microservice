const knexMock = jest.genMockFromModule('knex')({
    client: "pg"
})

function where() {
    jest.fn(() => Promise.resolve({data: []}))
}

module.exports = {
    knexMock: knexMock, 
    where: where
}