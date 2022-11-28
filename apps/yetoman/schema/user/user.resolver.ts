import { Arg, Query, Resolver } from "type-graphql";

import { User } from "../user";

const users = [{ name: 'Val' }, { name: 'Tome' }];
@Resolver(User)
export class UsersResolver {
  @Query(() => User, { nullable: true })
  user(@Arg('name', () => String) name: string): User | undefined {
    const user = users.find((user) => user.name === name);
    if (user === undefined) {
      throw new Error('User not found');
    }
    return user;
  }

  @Query(() => [User])
  users(): User[] {
    return users;
  }
}
