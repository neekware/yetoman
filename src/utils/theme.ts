export function setTheme() {
  const colorTheme = localStorage.getItem("color-theme");
  if (colorTheme === "dark") {
    document.documentElement.classList.add("dark");
  } else if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
    localStorage.setItem("color-theme", colorTheme || "dark");
    document.documentElement.classList.add("dark");
  } else {
    document.documentElement.classList.remove("dark");
  }
}
