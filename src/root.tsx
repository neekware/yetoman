import { component$ } from "@builder.io/qwik";
import {
  QwikCityProvider,
  RouterOutlet,
  ServiceWorkerRegister,
} from "@builder.io/qwik-city";
import { RouterHead } from "./components/router-head/router-head";
import "./global.css";
import { setLanguage } from "./utils/language";
import { setTheme } from "./utils/theme";
import { combineExecutables, htmlDecode } from "./utils/transform";

const preOutlet = htmlDecode(combineExecutables([setTheme, setLanguage]));
/**
 * The root of a QwikCity site always start with the <QwikCityProvider>
 * component, immediately followed by the document's <head> and <body>. Don't
 * remove the `<head>` and `<body>` elements.
 *
 * @returns The root of the site.
 * @public @name Root
 */
export default component$(() => {
  return (
    <QwikCityProvider>
      <head>
        <meta charSet="utf-8" />
        <link rel="manifest" href="/manifest.json" />
        <RouterHead />
      </head>
      <body>
        <script dangerouslySetInnerHTML={preOutlet} />
        <RouterOutlet />
        <ServiceWorkerRegister />
      </body>
    </QwikCityProvider>
  );
});
