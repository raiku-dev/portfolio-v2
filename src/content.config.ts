import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const blogpost = defineCollection({
	loader: glob({ pattern: '**/*.{mdx,md}', base: './src/blogposts/' }),
	schema: ({ image }) => z.object({
		title: z.string(),
		description: z.string(),
		pubDate: z.coerce.date(),
		updatedDate: z.coerce.date().optional(),
		author: z.object({
			name: z.string(),
			img: image().optional(),
		}).default({ name: 'Mikayil Gacek' }),
		cover: image().optional(),
		coverAlt: z.string().default('Blog Post Cover Image'),
		categories: z.array(z.string())
	})
});

export const collections = { blogpost };
