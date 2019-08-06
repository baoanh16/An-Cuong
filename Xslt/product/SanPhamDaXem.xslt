<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">

		<section class="viewed-product">
			<div class="product-article-title">
				<h2>
					<xsl:value-of select='/ProductList/ModuleTitle'></xsl:value-of>
				</h2>
			</div>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<xsl:apply-templates select='/ProductList/Product'></xsl:apply-templates>
				</div>
				<div class="swiper-prev"><span class="fas fa-chevron-left"></span></div>
				<div class="swiper-next"><span class="fas fa-chevron-right"></span></div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='Product'>
		<div class="swiper-slide">
			<div class="item">
				<div class="figure">
					<a class="figure-image shine">
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
					<div class="figure-caption">
						<h4>
							<xsl:text>MS: </xsl:text>
							<xsl:value-of select='Code'></xsl:value-of>
						</h4>
						<p>
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
						</p>
						<h5>
							<xsl:value-of select='Price'></xsl:value-of>
						</h5>
					</div>
					<div class="item-cart">
						<a href="javascript:;" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
							<xsl:attribute name="data-productid">
								<xsl:value-of select="ProductId"></xsl:value-of>
							</xsl:attribute>
							<em class="mdi mdi-cart"></em>
							<span>Thêm vào giỏ hàng</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>