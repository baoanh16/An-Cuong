<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="index-guide-video">
			<div class="guide-video-wrapper">
				<h2><xsl:value-of select='/VideoList/ModuleTitle' disable-output-escaping='yes'></xsl:value-of></h2>
				<xsl:apply-templates select="/VideoList/Video" mode="Big"></xsl:apply-templates>
			</div>
		</div>
		<div class="row no-gutters">
			<xsl:apply-templates select="/VideoList/Video" mode="Small"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match='Video' mode="Big">
		<xsl:if test="position()=1">
			<a data-fancybox='1'>
				<xsl:attribute name='href'>
					<xsl:value-of select="VideoUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<img>
				<xsl:attribute name='src'>
					<xsl:value-of select='ImageUrl'></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name='alt'>
					<xsl:value-of select='Title'></xsl:value-of>
				</xsl:attribute>
				</img>
				<h5>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</h5>
			</a>
		</xsl:if>
	</xsl:template>
	<xsl:template match='Video' mode="Small">
		<xsl:if test="position()>1">
			<div class="col-4 guide-video-sub">
				<a>
					<xsl:attribute name='data-fancybox'>
						<xsl:value-of select='position()'></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name='href'>
						<xsl:value-of select="VideoUrl" disable-output-escaping="yes"></xsl:value-of>
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
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>