# Transmission Setup

Three separate transmission clients doing slightly different things, but from the same core repo.

Set up in this way to allow dependabot to pick up as many dependency updates as possible.

## Flexget

All three use flexget to read from RSS feeds and automatically download things.
Config files are kept in a volume; this will need to be initialised before flexget will work.

## Transmission

Transmission is set up the same for all three, and keeps its configuration in a volume.

## Filebot

Two of the instances use filebot to copy files around the system.
The licence is stored as a secret in github and passed on image creation.
