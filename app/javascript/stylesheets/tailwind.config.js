module.exports = {
  purge: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/javascript/**/*.vue",
  ],
  darkMode: false,
  theme: {
    extend: {
      colors: {
        blue: "#3778c2",
        green: "#5fb523",
        grey: "#434b54",
      },
    }},
  variants: {
    extend: {},
  },
  plugins: [require('@tailwindcss/forms'),],
}
