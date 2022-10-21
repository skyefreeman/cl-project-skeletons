# Install dependancies.
install:
	npm install -D tailwindcss; npx tailwindcss init

# Starts dev tools.
develop:
	browser-sync start --proxy "localhost:8080" --files "**/*" \
	& npx tailwindcss -i ./static/css/main.css -o ./static/css/tailwind.css --watch

# Creates a production build.
build:
	npx tailwindcss -o tailwind.css --minify; mv tailwind.css static/css/tailwind.css
