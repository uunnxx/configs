-- uv tool install django-language-server
return {
	cmd = { "djls", "serve" },
	filetypes = { "htmldjango", "html", "python" },
	root_markers = { "manage.py", "pyproject.toml", ".git" },
}
