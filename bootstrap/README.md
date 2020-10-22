# Docker Related File

This directory contains support files for creating docker container.

## Setup

1. Create `web.env` from `bootstrap/web.env.template`.
2. Create `db.env` from `bootstrap/db.env.template`.
3. Create docker image with `docker-compose build`.
4. Bring up the containers with `docker-compose up -d`.

## TODO

What are still broken.

-[ ] `rake db:migrate` and probably the seed as well.

Current problem is that mysql 5 may not have auto bootstraping of user and database.

- [x] Web and judge scripts is installed.
- [ ] Install and configure web server.
- [ ] Migrate the database during the start up.
- [ ] Seeding database only once (may have to be manully run).
- [ ] Support for problem that requires more than one file. (e.g. use Makefile, or just multiple files).
- [ ] Map judge scripts' directories into volume.
- [ ] Add Auth0, so loggin via Microsoft Azure AD is possible.
