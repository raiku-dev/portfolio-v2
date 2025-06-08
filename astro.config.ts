// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import node from '@astrojs/node';
import { remarkReadingTime } from './src/plugins/readingTime';

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
	adapter: node({
		mode: 'standalone'
	})
});
