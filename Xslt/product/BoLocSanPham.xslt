<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="sidebar-filter ajaxfilterresponse">
			<div class="row no-gutters ">
				<div class="col-12">
					<div class="filter-wrapper">
						<div class="filter-title">
							<h2><xsl:value-of select="/ProductFilter/PriceText2"></xsl:value-of></h2><em class="mdi mdi-menu-down"></em>
						</div>
						<div class="filter-body">
							<div class="filter-input-wrapper">
								<div class="form-group">
									<input type="text" class="min-input">
									<xsl:attribute name='value'>
										<xsl:value-of select="/ProductFilter/PriceMin"></xsl:value-of>
									</xsl:attribute>
									</input>
								</div>
								<div class="form-group">
									<input type="text" class="max-input">
									<xsl:attribute name='value'>
										<xsl:value-of select="/ProductFilter/PriceMax"></xsl:value-of>
									</xsl:attribute>
									</input>
								</div>
							</div>
							<div class="frm-btnwrap">
								<a class="btn-ok" onclick="priceFilter()">

									<xsl:text>Ok</xsl:text>
								</a>
								<div class="hidden">
									<a class="urlwithprice">
										<xsl:attribute name="href">
											<xsl:value-of select="/ProductFilter/UrlWithPrice"></xsl:value-of>
										</xsl:attribute>
									</a>
									<a class="urlwithoutprice">
										<xsl:attribute name="href">
											<xsl:value-of select="/ProductFilter/UrlWithoutPrice"></xsl:value-of>
										</xsl:attribute>
									</a>
									<a class="pricemin"></a>
									<a class="pricemax"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<xsl:apply-templates select="/ProductFilter/Group"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match='Group'>
		<div class="row no-gutters">
			<div class="col-12">
				<div class="filter-wrapper">
					<div class="filter-title">
						<h2>
							<xsl:value-of select='Title'></xsl:value-of>
						</h2><em class="mdi mdi-menu-down"></em>
					</div>
					<div class="filter-body">
						<xsl:apply-templates select='Option'></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match='Option'>
		<div class="form-group form-check">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name='class'>
					<xsl:text>form-group form-check active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a>
				<xsl:attribute name='href'>
					<xsl:value-of select='Url'></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name='target'>
					<xsl:value-of select='Target'></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select='Title'></xsl:value-of>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>