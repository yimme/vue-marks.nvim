# Vue Marks Neovim Plugin

## Installation

Using Lazy.nvim:

```lua
{
    'yourusername/vue-marks.nvim',
    ft = {'vue'},
    config = function()
        require('vue-marks').setup()
    end
}
```

## Features

- Automatically marks Vue file tags when opening a Vue file
- Provides `:VueMarkTags` command to manually mark tags
- Sets marks:
  - `s` on `<script *>` tag
  - `t` on `<template *>` tag
  - `c` on `<style *>` tag


## Commands

- `:VueMarkTags` - Manually mark Vue file tags
