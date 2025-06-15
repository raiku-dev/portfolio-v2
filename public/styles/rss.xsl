<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
			<head>
				<title><xsl:value-of select="/rss/channel/title" /> Web Feed</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
				<style>
					@font-face {
					font-family: 'Victor Mono';
					font-style: normal;
					font-weight: 100 900;
					src: url('/fonts/vm.woff2') format('woff2');
					}
					@font-face {
					font-family: 'Victor Mono';
					font-style: italic;
					font-weight: 100 900;
					src: url('/fonts/vm-i.woff2') format('woff2');
					}
					@font-face {
					font-family: 'JetBrains Mono';
					font-style: normal;
					font-weight: 100 900;
					src: url('/fonts/jb.woff2') format('woff2');
					}
					@font-face {
					font-family: 'JetBrains Mono';
					font-style: italic;
					font-weight: 100 900;
					src: url('/fonts/jb-i.woff2') format('woff2');
					}

					p { margin: 1em 0; }
					h2, h3 { margin: 1em 0 0 0; }
					h1,h2,h3 { font-family: 'JetBrains Mono'; font-weight: 900; text-transform:
					uppercase; }
					a { color: #eecc00; }
					a:hover { color: #bb9000; }

					body {
					padding: 10px 20px;
					background-color: #111111;
					color: lightgray;
					margin: 0 auto;
					max-width: 800px;
					font-family: 'Victor Mono', monospace;
					font-weight: normal;
					}

					nav {
					color: white;
					padding: 20px 0;
					}

					.content {
					display: flex;
					flex-direction: column;
					gap: 24px;
					}

					.items-heading {
					margin-top: 80px;
					margin-bottom: 20px;
					}

					.post {
					box-shadow: 0 0 12px #00000099;
					border: 1px solid #bb9000;
					padding: 20px;
					border-radius: 12px;
					}

					.post h3 {
					margin: 0 0 8px;
					}

					.summary {
					font-size: 0.9rem;
					margin: 0 0 32px;
					}

					.categories {
					font-size: 0.8rem;
					display: flex;
					gap: 12px;
					}

					.category-pill {
					background-color: #333;
					border-radius: 50px;
					padding: 4 12px;
					}

					.pubdate {
					display: block;
					margin-bottom: 20px;
					color: #777;
					}
				</style>
			</head>

			<body>
				<nav>
					<p>
						<strong>This is a web feed,</strong> also known as an RSS feed. <strong>
						Subscribe</strong> by copying the URL from the address bar into your
						newsreader. </p>

					<p> Visit <a href="https://aboutfeeds.com" target="_blank">About Feeds</a> to
						get started with newsreaders and subscribing. It’s free. </p>
				</nav>

				<div class="content">
					<header>
						<h1>
							<xsl:value-of select="/rss/channel/title" />
						</h1>

						<p>
							<xsl:value-of select="/rss/channel/description" />
						</p>

						<a target="_blank">
							<xsl:attribute name="href">
								<xsl:value-of select="/rss/channel/link" />
							</xsl:attribute>
							Visit Website &#x2192; </a>
					</header>

					<h2 class="items-heading">Recent Items</h2>

					<xsl:for-each select="/rss/channel/item">
						<div class="post">
							<h3>
								<a target="_blank">
									<xsl:attribute name="href">
										<xsl:value-of select="link" />
									</xsl:attribute>
									<xsl:value-of select="title" />
								</a>
							</h3>

							<small class="pubdate"> Published: <xsl:value-of select="pubDate" />
							</small>

							<p class="summary">
								<xsl:value-of select="description" />
							</p>

							<div class="categories">
								<xsl:for-each select="category">
									<a target="_blank" class="category-pill">
										<xsl:attribute name="href">/tags/<xsl:value-of
												select="." />
										</xsl:attribute>
										<span>#</span>
										<xsl:value-of select="." />
									</a>
								</xsl:for-each>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
