fake_channel_id?=123

create-env-files:
	cp ./backend/.env.example .env.backend
	cp ./frontend/.env.example .env.frontend

setup-env: create-env-files
	sed -i 's/^VITE_FORCE_CHANNEL_ID=.*/VITE_FORCE_CHANNEL_ID=$(fake_channel_id)/' .env.frontend
	$(MAKE) set-twitch-signature-validation

set-twitch-signature-validation:
	@if echo "$(ARGS)" | grep -q -- '--disable-signature-validation'; then \
		sed -i 's/^twitch_signature_validation=.*/twitch_signature_validation=false/' .env.backend; \
	else \
		sed -i 's/^twitch_signature_validation=.*/twitch_signature_validation=true/' .env.backend; \
	fi

update-submodules:
  git submodule update --init --recursive