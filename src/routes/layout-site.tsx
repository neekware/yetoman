import { component$, Slot } from "@builder.io/qwik";
import { loader$ } from "@builder.io/qwik-city";
import { Navigation } from "~/components/navigation";

export const useServerTimeLoader = loader$(() => {
  return {
    date: new Date().toISOString(),
  };
});

export default component$(() => {
  const serverTime = useServerTimeLoader();
  return (
    <>
      <main>
        <Navigation />
        <section>
          <Slot />
        </section>
      </main>
      <footer>
        <div class="bg-gray-900 tet-white[300] p-14 text-center">
          <a href="https://www.builder.io/" target="_blank">
            Made with ♡ by Builder.io
            <div>{serverTime.value.date}</div>
          </a>
        </div>
      </footer>
    </>
  );
});
