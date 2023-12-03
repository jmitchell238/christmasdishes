/** @type {import('tailwindcss').Config} */

import defaultTheme from "tailwindcss/defaultTheme";

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  safelist: [
  'bg-green-500',
  'text-white',
  'px-4',
  'py-2',
  'fixed',
  'w-full',
  'top-0',
  'left-0',
  'z-50',
  'hidden'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      gradientColorStops: theme => ({
        ...theme('colors'),
        'red': '#ff0000',
        'green': '#00ff00',
        'blue': '#0000ff',
      }),
    },
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
  variants: {
    extend: {
      backgroundColor: ['disabled']
    }
  }
}
