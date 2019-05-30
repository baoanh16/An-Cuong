<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="product-manuals">
			<div class="article-section-title">
				<h2>
					<xsl:value-of select='/NewsList/ZoneTitle'></xsl:value-of>
				</h2>
			</div>
			<div class="row">
				<xsl:apply-templates select='/NewsList/News'></xsl:apply-templates>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='News'>
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