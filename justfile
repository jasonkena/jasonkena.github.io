default:
    just --list

render:
    find . \( -path ./blog -o -path ./blog_src/_site -o -path ./blog_src/.quarto \) -prune -o \( -name '*.yaml' -o -name '*.yml' -o -name '*.qmd' \) -print | entr -s 'uv run render.py && quarto render blog_src && rm -rf blog && cp -r blog_src/_site blog'

serve port="8000":
    open http://localhost:{{port}}/ & python3 -m http.server {{port}}
