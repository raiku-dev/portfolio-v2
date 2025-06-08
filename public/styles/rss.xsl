<?xml version="1.0" encoding="utf-8"?>
<!--
TODO: Style RSS Feed
-->
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
					p { margin: 1em 0; }
					h2, h3 { margin: 1em 0 0 0; }
					a { color: yellow; }
					a:hover { color: lightgray; }

					body {
					padding: 10px 20px;
					background-color: #222222;
					color: lightgray;
					margin: 0 auto;
					max-width: 800px;
					font-family: system-ui, sans-serif;
					font-weight: normal;
					}

					nav {
					color: white;
					padding: 20px 0;
					}

					.summary { font-style: italic; }
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

				<div>
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

					<h2>Recent Items</h2>

					<xsl:for-each select="/rss/channel/item">
						<div>
							<h3>
								<a target="_blank">
									<xsl:attribute name="href">
										<xsl:value-of select="link" />
									</xsl:attribute>
									<xsl:value-of select="title" />
								</a>
							</h3>

							<div class="categories">
								<xsl:for-each select="category">
									<small class="category-pill">
										<xsl:value-of select="." />
									</small>
								</xsl:for-each>
							</div>

							<p class="summary">
								<xsl:value-of select="description" />
							</p>

							<small> Published: <xsl:value-of select="pubDate" />
							</small>
						</div>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
