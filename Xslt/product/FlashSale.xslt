<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="flash-sale">
			<div class="product-article-title">
				<h2>
					<img src="/Data/Sites/1/skins/default/img/flash.png" alt="" />
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
							<s style="display: block; font-size: 11px;color: #666;">
								<xsl:value-of select='OldPrice'></xsl:value-of>
							</s>
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
				<xsl:if test="OldPrice != ''">
					<div class="discount">
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
						<span>
							<xsl:text>-</xsl:text>
							<xsl:value-of select="ceiling($percentage)"></xsl:value-of>
							<xsl:text>%</xsl:text>
						</span>
					</div>
				</xsl:if>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>