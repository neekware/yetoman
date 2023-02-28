import { component$ } from "@builder.io/qwik";
import { Link } from "@builder.io/qwik-city";

export const Navigation = component$(() => {
  return (
    <div class="flex items-center justify-between bg-white text-black shadow-xl py-5 pl-5 pr-5">
      <div>LOGO</div>
      <ul class="flex gap-4">
        <li>
          <Link href="/">Home</Link>
        </li>
        <Link href="/about">About</Link>
      </ul>
    </div>
  );
});
