import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const blog = defineCollection({
	loader: glob({ pattern: '**/*.{mdx,md}', base: './src/blogposts/' }),
	schema: z.object({
		title: z.string(),
		description: z.string(),
		pubDate: z.coerce.date(),
		updatedDate: z.coerce.date().optional(),
		author: z.string().default('Mikayil Gacek'),
		image: z.object({
			src: z.string(),
			alt: z.string()
		}).optional(), // TODO: Add default img ???
		categories: z.array(z.string())
	})
});

export const collections = { blog };
