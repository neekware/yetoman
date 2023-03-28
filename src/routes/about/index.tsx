import { component$ } from "@builder.io/qwik";
import { DocumentHead } from "@builder.io/qwik-city";

const About = component$(() => {
  return (
    <div class="flex items-center">
      <div>About Qwik!</div>;
    </div>
  );
});

export default About;

export const head: DocumentHead = {
  title: "Qwik About",
};
