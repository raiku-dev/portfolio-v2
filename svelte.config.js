import { vitePreprocess } from '@astrojs/svelte';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const currentDir = dirname(fileURLToPath(import.meta.url));

export default {
	preprocess: vitePreprocess({
		style: {
			css: {
				preprocessorOptions: {
					scss: {
						api: 'modern-compiler',
						additionalData: `@use "${join(currentDir, './src/assets/styles/mixins')}" as *;`
					}
				}
			}
		}
	})
};
