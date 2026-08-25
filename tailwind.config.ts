import type { Config } from "tailwindcss";

const config: Config = {
  content: ["./src/**/*.{js,ts,jsx,tsx,mdx}"],
  theme: {
    extend: {
      colors: {
        brand: {
          50: "#fdf2f6",
          100: "#fce7ef",
          200: "#fbcfe0",
          300: "#f9a8c5",
          400: "#f472a3",
          500: "#ec4682",
          600: "#db2763",
          700: "#be184c",
          800: "#9d1740",
          900: "#831838",
        },
        gold: "#c9a227",
        ink: "#1f1723",
      },
      fontFamily: {
        sans: ["Cairo", "Tahoma", "sans-serif"],
      },
    },
  },
  plugins: [],
};
export default config;
