import { component$, useStore, useTask$ } from "@builder.io/qwik";

export const Button = component$(() => {
  const state = useStore({ message: "Qwik Button!", color: "blue" });

  useTask$(({ track }) => {
    track(state);
    console.log("timeout");
  });

  return (
    <button
      onClick$={() => {}}
      class="bg-sky-500 hover:bg-sky-700 text-white font-bold py-2 px-4 rounded"
    >
      Click me
    </button>
  );
});
