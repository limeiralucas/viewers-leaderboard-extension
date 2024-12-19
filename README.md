# Viewers Leaderboard Extension
A Twitch extension that shows a leaderboard of viewers

This repository is a centralized way to run the [frontend](https://github.com/limeiralucas/viewers-leaderboard-frontend) and [backend](https://github.com/limeiralucas/viewers-leaderboard-backend) applications together using Docker.

## How to setup the project

To set up the project, follow these steps:

1. Clone the repository:
    ```sh
    git clone https://github.com/limeiralucas/viewers-leaderboard-extension.git
    cd viewers-leaderboard-extension
    ```

2. Initialize and update submodules:
    ```sh
    git submodule update --init --recursive
    ```
    or
    ```sh
    make update-submodules
    ```

3. Create environment files and set up the environment:
    ```sh
    make setup-env
    ```

    You can also pass a custom `fake_channel_id` and additional arguments:
    ```sh
    make setup-env fake_channel_id=your_fake_channel_id ARGS="--disable-signature-validation"
    ```

    And customize the update interval of the ranking panel:
     ```sh
    make setup-env update_interval_ms=10000 ARGS="--disable-signature-validation"
    ``` 

    The `--disable-signature-validation` argument, disables the validation of the signature sent through header when Twitch sends a request to the webhook endpoint.

## Environment Variables

### Backend

The `.env.backend` file contains the following variables:

- `NAME`: The name of the backend service.
- `APP_NAME`: The application name.
- `TWITCH_SIGNATURE_VALIDATION`: Set to `true` or `false` to enable or disable Twitch signature validation.
- `ENV`: The environment (e.g., `dev`, `prod`).
- `APP_CLIENT_ID`: The client ID for the application.
- `APP_CLIENT_SECRET`: The client secret for the application.
- `APP_ACCESS_TOKEN`: The access token for the application.
- `WEBHOOK_SECRET`: The webhook secret.
- `MONGO_CONN_STR`: The MongoDB connection string.
- `MONGO_DB_NAME`: The MongoDB database name.
- `PORT`: The port on which the backend service runs.

### Frontend

The `.env.frontend` file contains the following variables:

- `VITE_API_BASE_URL`: The base URL for the API.
- `VITE_FORCE_CHANNEL_ID`: The channel ID to be forced.

## Docker

To run the project using Docker, use the following command:

```sh
docker-compose up --build
```

## Running inside of Twitch

To check how to setup the application to run inside of Twitch, please refer to the documentation [Running on Twitch](./docs/Running%20on%20Twitch.md)