<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="project-detail">
			<div class="article-section-title">
				<h2>
					<xsl:value-of select='/NewsDetail/Title'></xsl:value-of>
					<xsl:value-of select='/NewsDetail/EditLink' disable-output-escaping='yes'></xsl:value-of>
				</h2>
			</div>
			<div class="attribute-list">
				<div class="row">
					<xsl:apply-templates select='/NewsDetail/NewsAttributes'></xsl:apply-templates>
				</div>
			</div>
						<div class="social-network">
			</div>
			<ul class="project-detail-nav">
				<li>
					<a href="javascript:;">
						<em class="mdi mdi-folder-multiple-image"></em>
						<p>Hình ảnh</p>
					</a>
				</li>
				<li>
					<a data-fancybox="video">
						<xsl:attribute name='href'>
							<xsl:value-of select='/NewsDetail/SubTitle'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='title'>
							<xsl:value-of select='/NewsDetail/Title'></xsl:value-of>
						</xsl:attribute>
						<em class="mdi mdi-play"></em>
						<p>Video Clip</p>
					</a>
				</li>
			</ul>
			<div class="swiper-project-detail">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select='/NewsDetail/NewsImages'></xsl:apply-templates>
					</div>
				</div>
				<div class="swiper-navigation swiper-project-detail-prev"><em class="mdi mdi-chevron-left"></em></div>
				<div class="swiper-navigation swiper-project-detail-next"><em class="mdi mdi-chevron-right"></em></div>
			</div>
			<div class="other-project">
				<div class="product-article-title">
					<h2>Dự án khác</h2>
				</div>
				<div class="row">
					<xsl:apply-templates select='/NewsDetail/NewsOther'></xsl:apply-templates>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='NewsAttributes'>
		<div class="col-sm-6">
			<div class="row">
				<div class="col-4">
					<h4>
						<xsl:value-of select='Title'></xsl:value-of>
					</h4>
				</div>
				<div class="col-8">
					<p>
						<xsl:value-of select='Content' disable-output-escaping='yes'></xsl:value-of>
					</p>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match='NewsImages'>
		<div class="swiper-slide">
			<div class="img-block">
				<img>
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
	<xsl:template match='NewsOther'>
		<div class="col-sm-6">
			<div class="figure">
				<div class="figure-image shine">
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
				<div class="figure-caption">
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
					<xsl:value-of select='BriefContent' disable-output-escaping='yes'></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>