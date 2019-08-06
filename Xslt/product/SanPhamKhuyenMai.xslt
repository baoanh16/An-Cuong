<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="index-news-swiper">
			<h2>
				<xsl:value-of select='/ProductList/ModuleTitle' disable-output-escaping='yes'></xsl:value-of>
			</h2>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<xsl:apply-templates select='/ProductList/Product'></xsl:apply-templates>
				</div>
			</div>
			<div class="index-news-swiper-prev"><span class="mdi mdi-chevron-left"></span></div>
			<div class="index-news-swiper-next"><span class="mdi mdi-chevron-right"></span></div>
		</div>
	</xsl:template>
	<xsl:template match='Product'>
		<div class="swiper-slide">
			<div class="swiper-image">
				<img>
				<xsl:attribute name='src'>
					<xsl:value-of select='ThumbnailUrl'></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name='alt'>
					<xsl:value-of select='Title'></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
			<div class="swiper-caption">
				<h3>
					<!-- <xsl:value-of select='BriefContent' disable-output-escaping='yes'></xsl:value-of> -->
					<xsl:text>ƯU ĐÃI </xsl:text>
					<xsl:if test="OldPrice != ''">
						<xsl:variable name='price'>
							<xsl:value-of select="substring-before(Price, ' ')"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name='priceNumber'>
							<xsl:value-of select="translate($price, '.', '')"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name='oldprice'>
							<xsl:value-of select="substring-before(OldPrice, ' ')"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name='oldPriceNumber'>
							<xsl:value-of select="translate($oldprice, '.', '')"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name='percentage'>
							<xsl:value-of select="100 - ($priceNumber div $oldPriceNumber)*100"></xsl:value-of>
						</xsl:variable>
						<xsl:value-of select="ceiling($percentage)"></xsl:value-of>
						<xsl:text>%</xsl:text>
					</xsl:if>
					<xsl:text> HẤP DẪN</xsl:text>
				</h3>
				<h5>
					<xsl:text>Mã số: </xsl:text>
					<xsl:value-of select='Code'></xsl:value-of>
				</h5>
				<h4>
					<xsl:value-of select='Price'></xsl:value-of>
				</h4>
				<p>
					<xsl:value-of select='OldPrice'></xsl:value-of>
				</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>