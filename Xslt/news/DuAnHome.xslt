<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates select='/NewsList/News'></xsl:apply-templates>
	</xsl:template>
	<xsl:template match='News'>
		<div class="figure">
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
			<div class="figure-caption">
				<h5>
					<xsl:value-of select='Title'></xsl:value-of>
				</h5>
				<div class="figure-button">
					<a>
						<xsl:attribute name='href'>
							<xsl:value-of select='Url'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='title'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						<xsl:text>Xem thêm</xsl:text>
						<em class="mdi mdi-play"></em>
					</a>
				</div>

			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>