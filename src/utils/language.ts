export function setLanguage() {
  const language =
    localStorage.getItem("language") || window.navigator.language || "en";
  localStorage.setItem("language", language);
  document.documentElement.setAttribute("lang", language);
}
