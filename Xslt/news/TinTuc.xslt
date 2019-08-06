<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="news-display">
			<div class="article-section-title">
				<h2>
					<xsl:value-of select='/NewsList/ZoneTitle'></xsl:value-of>
				</h2>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-8">
					<xsl:apply-templates select='/NewsList/News' mode='BigNews'></xsl:apply-templates>
				</div>
				<div class="col-md-6 col-lg-4">
					<xsl:apply-templates select='/NewsList/News' mode='SideNews'></xsl:apply-templates>
				</div>
			</div>
			<div class="row">
				<xsl:apply-templates select='/NewsList/News' mode='SmallNews'></xsl:apply-templates>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='News' mode='BigNews'>
		<xsl:if test="position()=1">
			<div class="big-news">
				<div class="news-image shine">
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
				<div class="news-caption">
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
		</xsl:if>
	</xsl:template>
	<xsl:template match='News' mode='SideNews'>
		<xsl:if test="position()>1 and position() &lt; 6">
			<div class="news-aside">
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
		</xsl:if>
	</xsl:template>
	<xsl:template match='News' mode='SmallNews'>
		<xsl:if test="position()>5">
			<div class="col-6 col-lg-4 news-item">
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
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>