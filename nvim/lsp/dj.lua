-- uv tool install django-language-server
return {
	cmd = { "djls", "serve" },
	filetypes = { "htmldjango" },
	root_markers = { "manage.py", "pyproject.toml", ".git" },
}
