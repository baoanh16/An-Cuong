<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="cart">
			<a class="checkout-url">
				<xsl:attribute name="href">
					<xsl:value-of select="/ShoppingCart/CheckoutUrl"></xsl:value-of>
				</xsl:attribute>
				<div class="cart-toggle"><em class="mdi mdi-cart"></em>
					<div class="amount-wrapper">
						<span class="text"><xsl:value-of select="/ShoppingCart/CartTypeShoppingCart"></xsl:value-of> </span>
						<xsl:text>(</xsl:text>
						<span class="amount">

							<xsl:value-of select="/ShoppingCart/TotalProducts" disable-output-escaping="yes">
							</xsl:value-of>

						</span>
						<xsl:text>)</xsl:text>
					</div>
				</div>
			</a>
		</div>
		<ul>
			<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
		</ul>
		<!-- <div class="cartpanel">
			<div class="title">
				<xsl:value-of select="/ShoppingCart/CartSummaryText" disable-output-escaping="yes"></xsl:value-of>
			</div>
			<div class="btn-closecart">
				<span class="lnr lnr-cross"></span>
			</div>
			<xsl:if test="count(/ShoppingCart/CartItem)>0">
				<div class="cart-list">
					<ul>
						<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
					</ul>
				</div>
				<div class="checkout-panel">
					<div class="total">
						<xsl:value-of select="/ShoppingCart/SubTotalText"></xsl:value-of>
						<xsl:text>: </xsl:text>
						<strong>
							<xsl:value-of select="/ShoppingCart/Total"></xsl:value-of>
						</strong>
					</div>
					<div class="button">
						<a class="btn-checkout">
							<xsl:attribute name="href">
								<xsl:value-of select="/ShoppingCart/CheckoutUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="/ShoppingCart/CheckoutProcessText"></xsl:value-of>
						</a>
						<a class="btn-viewcart">
							<xsl:attribute name="href">
								<xsl:value-of select="/ShoppingCart/CartPageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="/ShoppingCart/CartText"></xsl:value-of>
						</a>
					</div>
				</div>
			</xsl:if>
		</div> -->
	</xsl:template>
	<xsl:template match="CartItem">
		<xsl:if test="LastAddedItem='true'">
			<li class="last-added">
				<xsl:value-of select="Quantity"></xsl:value-of>
				<xsl:text> </xsl:text>
				<xsl:value-of select="Title"></xsl:value-of>
				<xsl:text> - </xsl:text>
				<xsl:value-of select="ItemSubTotal"></xsl:value-of>
			</li>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>