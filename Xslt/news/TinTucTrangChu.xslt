<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="index-news-figure">
			<xsl:apply-templates select='/NewsList/News' mode='BigNews'></xsl:apply-templates>
			<xsl:apply-templates select='/NewsList/News' mode='SmallNews'></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match='News' mode='BigNews'>
		<xsl:if test='position()=1'>
			<div class="figure">
				<h4>
					<a>
						<xsl:attribute name='href'>
							<xsl:value-of select='Url'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='title'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select='Title'></xsl:value-of>
					</a>
				</h4>
				<a>
					<xsl:attribute name='href'>
						<xsl:value-of select='Url'></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name='title'>
						<xsl:value-of select='Title'></xsl:value-of>
					</xsl:attribute>
					<div class="figure-image">
						<img>
						<xsl:attribute name='src'>
							<xsl:value-of select='ImageUrl'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='alt'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
				</a>
				<p>
					<xsl:value-of select='BriefContent' disable-output-escaping='yes'></xsl:value-of>
				</p>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match='News' mode='SmallNews'>
		<xsl:if test='position()>1'>
			<div class="figure-link">
				<a href="#">
					<em class="mdi mdi-chevron-right"></em>
					<xsl:attribute name='href'>
						<xsl:value-of select='Url'></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name='title'>
						<xsl:value-of select='Title'></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select='Title'></xsl:value-of>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>