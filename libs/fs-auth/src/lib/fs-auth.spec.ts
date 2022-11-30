import { fsAuth } from './fs-auth';

describe('fsAuth', () => {
  it('should work', () => {
    expect(fsAuth()).toEqual('fs-auth');
  });
});
