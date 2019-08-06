<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="swiper-container" id="index-swiper">
			<div class="swiper-wrapper">
				<xsl:apply-templates select='/BannerList/Banner'></xsl:apply-templates>
			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</xsl:template>

	<xsl:template match="Banner">
		<div class="swiper-slide">
			<div class="swiper-image shine">
			<a>
			<xsl:attribute name='href'>
				<xsl:value-of select='Url'></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name='target'>
				<xsl:value-of select='Target'></xsl:value-of>
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
			<div class="swiper-caption">
				<xsl:value-of select='Description' disable-output-escaping='yes'></xsl:value-of>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>