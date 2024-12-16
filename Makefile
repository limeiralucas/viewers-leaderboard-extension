setup-env:
	cp .env.backend.example .env.backend
	cp .env.frontend.example .env.frontend

update-submodules:
	git submodule foreach git pull origin main
