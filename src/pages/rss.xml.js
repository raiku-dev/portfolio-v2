import rss from '@astrojs/rss';
import { getCollection } from 'astro:content';

export async function GET(context) {
	const blog = await getCollection('blog');
	return rss({
		stylesheet: '/styles/rss.xsl',
		title: "Mikayil's Dev Blog",
		description:
			'Sharing learnings and all kinds of interesting things I come across.',
		site: context.site,
		items: blog.map(post => ({
			title: post.data.title,
			pubDate: post.data.pubDate,
			description: post.data.description,
			tags: post.data.tags.join(', '),
			link: `/blog/${post.id}/`
		}))
	});
}
