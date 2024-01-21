import { defineConfig } from "astro/config";
import react from "@astrojs/react";

import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
  site: 'https://calebcoverdale.github.io',
  base: '/HomeHive',
  renderers: [react],
  integrations: [react(), tailwind()],
});