// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import { remarkReadingTime } from './src/plugins/readingTime';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import devtoolsJson from 'vite-plugin-devtools-json';
import Icons from 'unplugin-icons/vite';

const currentDir = dirname(fileURLToPath(import.meta.url));

// https://astro.build/config
export default defineConfig({
	site: 'https://mikayil.dev',
	prefetch: {
		defaultStrategy: 'viewport',
		prefetchAll: true
	},
	integrations: [mdx()],
	markdown: {
		remarkPlugins: [remarkReadingTime]
	},
	vite: {
		plugins: [
			Icons({
				compiler: 'astro'
			}),
			devtoolsJson()
		],
		css: {
			preprocessorOptions: {
				scss: {
					api: 'modern-compiler',
					additionalData: `@use "${join(currentDir, './src/assets/styles/mixins')}" as *;`
				}
			}
		}
	}
});
