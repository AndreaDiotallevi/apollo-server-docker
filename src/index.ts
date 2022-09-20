import { ApolloServer } from "apollo-server"

const server = new ApolloServer({
    typeDefs: `#graphql
        type Query {
            hello: String
        }
    `,
    resolvers: {
        Query: {
            hello: () => "hello",
        },
    },
})

server.listen().then(({ url }) => {
    console.log(`🚀  Server ready at ${url}`)
})
