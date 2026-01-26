default:
    just --list

render:
    ls *.yaml | entr uv run render.py
