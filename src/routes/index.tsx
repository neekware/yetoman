import { component$ } from "@builder.io/qwik";
import type { DocumentHead } from "@builder.io/qwik-city";
import { Link } from "@builder.io/qwik-city";
import Features from "~/components/main/features";

export default component$(() => {
  return (
    <div>
      <h1 class="text-[green]">
        Welcome to Qwik <span class="lightning">⚡️</span>
      </h1>

      <Features />

      <Link class="mindblow" href="/flower/">
        Blow my mind 🤯
      </Link>
      <Link class="todolist" href="/todolist/">
        TODO demo 📝
      </Link>
    </div>
  );
});

export const head: DocumentHead = {
  title: "Welcome to Qwik",
  meta: [
    {
      name: "description",
      content: "Qwik site description",
    },
  ],
};
