import "./styles.css";

import { AppProps } from "next/app";
import Head from "next/head";

function CustomApp({ Component, pageProps }: AppProps) {
  return (
    <>
      <Head>
        <title>Welcome to yetoman!</title>
      </Head>
      <main className="flex-col justify-center px-4">
        <Component {...pageProps} />
      </main>
    </>
  );
}

export default CustomApp;
