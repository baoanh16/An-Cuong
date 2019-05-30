<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="product-detail">
			<div class="row">
				<div class="col-lg-7 product-detail-swiper">
					<div class="swiper-container swiper-product-top">
						<div class="swiper-wrapper">
							<xsl:apply-templates select='/ProductDetail/ProductImages' mode='BigThumbnail'>
							</xsl:apply-templates>
						</div>
						<div class="product-detail-button-next"></div>
						<div class="product-detail-button-prev"></div>
					</div>
					<h5>Lưu ý: Hình ảnh có thể là của một sản phẩm tương tự.</h5>
					<div class="swiper-container swiper-product-thumbs">
						<div class="swiper-wrapper">
							<xsl:apply-templates select='/ProductDetail/ProductImages' mode='SmallThumbnail'>
							</xsl:apply-templates>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="product-detail-information">
						<h2>
							<xsl:value-of select='/ProductDetail/Title'></xsl:value-of>
							<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h2>
						<h3>
							<xsl:value-of select='/ProductDetail/Price'></xsl:value-of>
						</h3>
						<div class="add-cart-wrapper">
							<div class="cart-item-quantity">
								<div class="input-group">
									<div class="input-group-btn">
										<a href="javascript:;" class="qty-minus btn btn-default btn-number"
											type="button" disabled="disabled" data-type="minus"
											data-field="quant[1]"></a><em class="mdi mdi-minus"></em>
									</div>
									<input class="product-details-quantity form-control input-number" type="text"
										value="1">
									<xsl:attribute name="name">
										<xsl:text>addtocart_</xsl:text>
										<xsl:value-of select="/ProductDetail/ProductId" disable-output-escaping="yes">
										</xsl:value-of>
										<xsl:text>.EnteredQuantity</xsl:text>
									</xsl:attribute>
									</input>
									<div class="input-group-btn">
										<a href="javascript:;" class="qty-plus btn btn-default btn-number" type="button"
											data-type="plus" data-field="quant[1]"></a><em class="mdi mdi-plus"></em>
									</div>
								</div>
							</div>
							<a class="cart-item-buy" href="javascript:;"
								onclick="AjaxCart.addproducttocart_details(this); return false;">
								<xsl:attribute name="data-productid">
									<xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
								</xsl:attribute>
								<em class="mdi mdi-cart"></em>
								<span>Mua ngay</span>
							</a>
						</div>
						<div class="row pd-line">
							<div class="col-sm-4">
								<h4>Mã số</h4>
							</div>
							<div class="col-sm-8">
								<h5>
									<xsl:value-of select='/ProductDetail/Code'></xsl:value-of>
								</h5>
							</div>
						</div>
						<xsl:apply-templates select='/ProductDetail/ProductAttributes'></xsl:apply-templates>
						<div class="row pd-line">
							<div class="social-network"></div>
						</div>
						<div class="row">
							<div class="col-sm-6 col-lg-12 col-xl-6 product-detail-support">
								<a download="">
									<xsl:attribute name='href'>
										<xsl:value-of select='/ProductDetail/FileUrl'></xsl:value-of>
									</xsl:attribute>
									<img src="/Data/Sites/1/skins/default/img/san-pham-ct/icon-pdf.png"
										alt="pdf file" />
									<p>tài liệu hướng dẫn</p>
								</a>
							</div>
							<div class="col-sm-6 col-lg-12 col-xl-6 product-detail-support">
								<a data-fancybox="gallery">
									<xsl:attribute name='href'>
										<xsl:value-of select='/ProductDetail/SubTitle' disable-output-escaping='yes'>
										</xsl:value-of>
									</xsl:attribute>
									<em class="mdi mdi-video"></em>
									<p>Video clip</p>
								</a>
							</div>
							<div class="col-sm-6 col-lg-12 col-xl-6 product-detail-support">
								<a download="">
									<xsl:attribute name='href'>
										<xsl:value-of select='/ProductDetail/BriefContent'></xsl:value-of>
									</xsl:attribute>
									<em class="mdi mdi-file-document"></em>
									<p>Hướng dân lắp đặt</p>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="product-others">
			<div class="product-article-title">
				<h2>
					sản phẩm khác
				</h2>
			</div>
			<div class="row">
				<xsl:apply-templates select='/ProductDetail/ProductOther'></xsl:apply-templates>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='ProductImages' mode="BigThumbnail">
		<div class="swiper-slide">
			<img>
			<xsl:attribute name='src'>
				<xsl:value-of select='ImageUrl'></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name='alt'>
				<xsl:value-of select='Title'></xsl:value-of>
			</xsl:attribute>
			</img>
		</div>
	</xsl:template>
	<xsl:template match='ProductImages' mode="SmallThumbnail">
		<div class="swiper-slide">
			<img>
			<xsl:attribute name='src'>
				<xsl:value-of select='ImageUrl'></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name='alt'>
				<xsl:value-of select='Title'></xsl:value-of>
			</xsl:attribute>
			</img>
		</div>
	</xsl:template>
	<xsl:template match='ProductAttributes'>
		<div class="row pd-line">
			<div class="col-sm-4">
				<h4>
					<xsl:value-of select='Title'></xsl:value-of>
				</h4>
			</div>
			<div class="col-sm-8">
				<p>
					<xsl:value-of select='Content' disable-output-escaping='yes'></xsl:value-of>
				</p>
			</div>
		</div>
	</xsl:template>
	<xsl:template match='ProductOther'>
		<div class="col-xl-3 col-sm-4 col-6">
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