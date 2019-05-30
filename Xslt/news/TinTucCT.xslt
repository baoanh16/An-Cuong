<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="news-detail">
			<div class="article-section-title">
				<h2>
					<xsl:value-of select='/NewsDetail/Title'></xsl:value-of>
					<xsl:value-of select='/NewsDetail/EditLink' disable-output-escaping='yes'></xsl:value-of>
				</h2>
				<p>
					<xsl:value-of select='/NewsDetail/CreatedDate'></xsl:value-of>
				</p>
			</div>
			<article>
				<xsl:value-of select='/NewsDetail/FullContent' disable-output-escaping='yes'></xsl:value-of>
			</article>
			<div class="social-network">
			</div>
			<div class="news-display">
				<div class="product-article-title">
					<h2>Tin tức khác</h2>
				</div>
				<div class="row">
					<xsl:apply-templates select='/NewsDetail/NewsOther'></xsl:apply-templates>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='NewsOther'>
		<div class="col-6 news-item">
			<div class="figure">
				<div class="figure-image shine">
					<a>
						<xsl:attribute name='href'>
							<xsl:value-of select='Url'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='title'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						<img>
						<xsl:attribute name='src'>
							<xsl:value-of select='ImageUrl'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='alt'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="figure-caption">
					<p>
						<xsl:value-of select='CreatedDate'></xsl:value-of>
					</p>
					<h5>
						<a>
							<xsl:attribute name='href'>
								<xsl:value-of select='Url'></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name='title'>
								<xsl:value-of select='Title'></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select='Title'></xsl:value-of>
						</a>
						<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
					</h5>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>