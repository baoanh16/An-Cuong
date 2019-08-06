<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="index-guide-swiper-wrapper">
			<h3>
				<xsl:value-of select='/NewsList/ModuleTitle' disable-output-escaping='yes'></xsl:value-of>
			</h3>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<xsl:apply-templates select='/NewsList/News'></xsl:apply-templates>
				</div>
			</div>
			<div class="navigation-wrapper">
				<div class="swiper-catelogue-prev"><em class="mdi mdi-arrow-left"></em></div>
				<div class="swiper-catelogue-next"><em class="mdi mdi-arrow-right"></em></div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match='News'>
		<div class="swiper-slide">
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
	</xsl:template>
</xsl:stylesheet>