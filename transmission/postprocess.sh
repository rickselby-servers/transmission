#!/bin/sh -xu

# Input Parameters
ARG_PATH="$TR_TORRENT_DIR/$TR_TORRENT_NAME"
ARG_NAME="$TR_TORRENT_NAME"
ARG_LABEL="N/A"

# Configuration
CONFIG_OUTPUT="/media/plex"

/usr/bin/filebot \
  -script fn:amc \
  --output "$CONFIG_OUTPUT" \
  --action hardlink \
  --conflict auto \
  -non-strict \
  --log-file amc.log \
  --def \
    gmail=$EMAIL \
    reportError=y \
    clean=y \
    ut_dir="$ARG_PATH" \
    ut_kind="multi" \
    ut_title="$ARG_NAME" \
    ut_label="$ARG_LABEL" \
    seriesFormat="{plex}"
