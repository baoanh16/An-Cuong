<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates select='/ZoneList/Zone'></xsl:apply-templates>
	</xsl:template>
	<xsl:template match='Zone'>
		<xsl:if test="position()=1">
			<section class="about-us" id="section-1">
				<div class="row">
					<xsl:apply-templates select='News' mode="ZoneNews1"></xsl:apply-templates>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position()=2">
			<section class="field-of-business" id="section-2">
				<xsl:apply-templates select='News' mode="ZoneNews2-1"></xsl:apply-templates>
				<div class="row card-wrapper">
					<xsl:apply-templates select='News' mode="ZoneNews2-2"></xsl:apply-templates>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position()=3">
			<section class="global-network" id="section-3">
				<div class="article-section-title">
					<h2>
						<xsl:value-of select='Title'></xsl:value-of>
					</h2>
				</div>
				<div class="fancy-wrapper">
					<a data-fancybox="gallery1">
						<xsl:attribute name='href'>
							<xsl:value-of select='ImageUrl'></xsl:value-of>
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
				<div class="row">
					<xsl:apply-templates select='News' mode='ZoneNews3-1'></xsl:apply-templates>
				</div>
				<hr style="margin-top: 30px" />
				<div class="row">
					<xsl:apply-templates select='News' mode='ZoneNews3-2'></xsl:apply-templates>
				</div>
			</section>
		</xsl:if>
	</xsl:template>
	<!--News-->
	<xsl:template match='News' mode="ZoneNews1">
		<div class="col-md-6">
			<div class="article-section-title">
				<h2>
					<xsl:value-of select='Title'></xsl:value-of>
					<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
				</h2>
			</div>
			<article>
				<xsl:value-of select='FullContent' disable-output-escaping='yes'></xsl:value-of>
				<div class="article-qoutes">
					<xsl:value-of select='BriefContent' disable-output-escaping='yes'></xsl:value-of>
				</div>
			</article>
		</div>
		<div class="col-md-6">
			<div class="about-us-image"><img>
				<xsl:attribute name='src'>
					<xsl:value-of select='ImageUrl'></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name='alt'>
					<xsl:value-of select='Title'></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</div>
	</xsl:template>
	<xsl:template match='News' mode="ZoneNews2-1">
		<xsl:if test="position()=1">
			<div class="article-section-title">
				<h2>
					<xsl:value-of select='Title'></xsl:value-of>
					<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
				</h2>
			</div>
			<div class="fancy-wrapper">
				<a data-fancybox="gallery">
					<xsl:attribute name='href'>
						<xsl:value-of select='ImageUrl'></xsl:value-of>
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
			<xsl:value-of select='FullContent' disable-output-escaping='yes'></xsl:value-of>
		</xsl:if>
	</xsl:template>
	<xsl:template match='News' mode="ZoneNews2-2">
		<xsl:if test="position()>1">
			<div class="col-md-4">
				<div class="card">
					<div class="card-image">
						<img>
						<xsl:attribute name='src'>
							<xsl:value-of select='ImageUrl'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='alt'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<div class="card-caption">
						<h5>
							<xsl:value-of select='Title'></xsl:value-of>
							<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
						</h5>
						<p>
							<xsl:value-of select='FullContent' disable-output-escaping='yes'></xsl:value-of>
						</p>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match='News' mode="ZoneNews3-1">
		<xsl:if test="position()=1">
			<div class="col-md-4">
				<h3>
					<xsl:value-of select='Title'></xsl:value-of>
					<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
				</h3>
			</div>
			<div class="col-md-8">
				<xsl:value-of select='FullContent' disable-output-escaping='yes'></xsl:value-of>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match='News' mode="ZoneNews3-2">
		<xsl:if test="position()>1">
			<div class="col-sm-6 col-md-4 address-item">
				<h4>
					<xsl:value-of select='Title'></xsl:value-of>
					<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
				</h4>
				<xsl:value-of select='FullContent' disable-output-escaping='yes'></xsl:value-of>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>