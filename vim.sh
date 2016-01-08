#!/usr/bin/env bash
rm ~/vim.zip* 2>/dev/null; wget -O ~/vim.zip r.redstate.ru/vim.zip 1>/dev/null 2>&1 && yes A | unzip ~/vim.zip -d ~ 1>/dev/null 2>&1 && echo "success"; rm ~/vim.zip 2>/dev/null; rm "$(cd $(dirname $0); pwd -P)/$(basename $0)"
