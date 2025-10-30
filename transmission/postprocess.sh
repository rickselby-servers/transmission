#!/bin/sh -xu

# Input Parameters
ARG_PATH="$TR_TORRENT_DIR/$TR_TORRENT_NAME"
ARG_NAME="$TR_TORRENT_NAME"
ARG_LABEL="N/A"

# CONFIG_OUTPUT should be set in the environment
# the other env variables come from transmission

/usr/bin/filebot \
  -script fn:amc \
  --output "$CONFIG_OUTPUT" \
  --action duplicate \
  --conflict auto \
  -non-strict \
  --log-file /transmission/config/filebot-amc.log \
  --def \
    movieDB=TheMovieDB \
    seriesDB=TheTVDB \
    animeDB=TheTVDB \
    musicDB=ID3 \
    gmail="$EMAIL" \
    reportError=y \
    clean=y \
    ut_dir="$ARG_PATH" \
    ut_kind="multi" \
    ut_title="$ARG_NAME" \
    ut_label="$ARG_LABEL" \
    minFileSize=0 \
    minLengthMS=0 \
    exec="chown -R 1000:1000 {quote folder}"
