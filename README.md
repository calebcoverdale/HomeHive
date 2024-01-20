# HomeHive 🐝🏠

Welcome to HomeHive, the AI-powered home inventory tracking app that makes organizing your household items a breeze! 🌬️📦

## Overview 🌐

HomeHive helps you discover what's hidden in your home, manage your belongings during a move, and replaces tedious manual lists with a smart, AI-driven inventory management system. 📝🐝

## Architecture 🏗️

```mermaid
graph LR
    A[SvelteKit Frontend] -- Fetch/Update Data --> B[PocketBase Backend]
    B -- Synchronize Data --> C[Cloudflare Services]
    C -- Secure & Optimize --> A
```


## Features 📋

- [x] Create a new inventory
- [ ] Add items to an inventory


## Development 🛠️


[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/calebcoverdale/HomeHive)