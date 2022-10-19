/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
	"./src/*.lisp",
	"./templates/**/*.{html,lisp}"
    ],
    theme: {
	extend: {
	    keyframes: {
		wiggle: {
		    '0%, 100%': { transform: 'rotate(-3deg)' },
		    '50%': { transform: 'rotate(3deg)' },
		}
	    },
	    colors: {
		'orange': '#de5f2a'
	    },
	    animation: {
		wiggle: 'wiggle 1s ease-in-out infinite'
	    }
	},
    },
    plugins: [],
}
