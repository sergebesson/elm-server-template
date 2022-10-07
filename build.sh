#!/bin/sh -e

rm -r dist 2>/dev/null || true
mkdir dist 2>/dev/null

# Copy index
cp src/index.html dist

# compile elm
js="dist/elm.js"
case "$1" in
dev)
	elm make --output=dist/elm.js src/Main.elm
	;;

prod)
	min="dist/elm.min.js"
	elm make --optimize --output=$js src/Main.elm
	uglifyjs $js --compress 'pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe' | uglifyjs --mangle --output $min
	gzip $min -k

	echo "Compiled size: $(wc $js -c | cut -f1 -d' ') bytes  ($js)"
	echo "Minified size: $(wc $min -c | cut -f1 -d' ') bytes  ($min)"
	echo "Gzipped  size: $(wc $min.gz -c | cut -f1 -d' ') bytes  ($min.gz)"

	rm $js
	sed -i 's/"elm.js"/"elm.min.js"/' dist/index.html
	;;

*) ;;
esac
