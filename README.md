# Vue Marks Neovim Plugin

## Installation

Using Lazy.nvim:

```lua
{
    'yimme/vue-marks.nvim',
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

## Config

```lua
marks = {
    script = 's' -- default mark for script tag
    template = 't' -- default mark for template tag
    style = 'c' -- default mark for style tag 
},
auto_mark = true -- Add marks automatically
```

## Commands

- `:VueMarkTags` - Manually mark Vue file tags
