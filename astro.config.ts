// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import node from '@astrojs/node';
import { remarkReadingTime } from './src/plugins/readingTime';
import { join, dirname } from 'path'
import { fileURLToPath } from 'url';
import svelte from '@astrojs/svelte';
import devtoolsJson from 'vite-plugin-devtools-json';

const currentDir = dirname(fileURLToPath(import.meta.url))

// https://astro.build/config
export default defineConfig({
    site: import.meta.env.DEV ? 'http://localhost:4321' : 'https://mikayil.dev',
    prefetch: {
        defaultStrategy: 'viewport',
        prefetchAll: true
    },
    integrations: [mdx(), svelte(),],
    markdown: {
        remarkPlugins: [remarkReadingTime]
    },
    adapter: node({
        mode: 'standalone'
    }),
    vite: {
        plugins: [
            devtoolsJson()
        ],
        css: {
            preprocessorOptions: {
                scss: {
                    api: "modern-compiler",
                    additionalData: `@use "${join(currentDir, './src/assets/styles/mixins')}" as *;`
                }
            }
        },
    }
});
