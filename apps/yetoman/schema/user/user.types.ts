import gql from "graphql-tag";

export const UserTypeDefs = gql`
  type Query {
    users: {name: String}
  }
`;
