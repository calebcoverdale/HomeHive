import { defineConfig } from 'astro/config';
import auth from "auth-astro";
import cloudflare from "@astrojs/cloudflare";

import * as Sentry from '@sentry/browser';
import spotlightjs from "@spotlightjs/astro";



// https://astro.build/config
export default defineConfig({
  integrations: [spotlightjs(), auth()],
  output: "server",
  adapter: cloudflare()
});

