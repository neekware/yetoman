import { HttpStatusCode } from '@mono/dto';

export function Index() {
  /*
   * Replace the elements below with your own.
   *
   * Note: The corresponding styles are in the ./index.scss file.
   */
  return (
    <div>
      <h1>Hello there! {HttpStatusCode.OK}</h1>
      <div>Hey YEToMAN! 👋</div>
    </div>
  );
}

export default Index;
