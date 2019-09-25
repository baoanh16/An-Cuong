<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="payment-info clearfix">
      <xsl:if test="count(/CheckoutMethod/Shipping)>0">
        <h3 class="title"><xsl:value-of select="/CheckoutMethod/ShippingMethodText"></xsl:value-of></h3>
        <div class="cart-form clearfix">
          <xsl:apply-templates select="/CheckoutMethod/Shipping"></xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="count(/CheckoutMethod/Payment)>0">
        <h3 class="title"><xsl:value-of select="/CheckoutMethod/PaymentMethodsText"></xsl:value-of></h3>
        <div class="cart-form clearfix">
          <xsl:apply-templates select="/CheckoutMethod/Payment"></xsl:apply-templates>
        </div>
      </xsl:if>
      <div class="cart-button clearfix">
        <a class="btn-back">
          <xsl:attribute name="href">
            <xsl:text>/cart</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="target">
            <xsl:value-of select="Target"></xsl:value-of>
          </xsl:attribute>
          <xsl:value-of select="/CheckoutMethod/BackToCartText"></xsl:value-of>
        </a>
        <button type="submit" id="checkout" name="checkout" class="hvr-sweep-to-right btn-continue">
          <xsl:attribute name="onclick">
            <xsl:text>AjaxCheckout.saveorder(true, '</xsl:text>
            <xsl:value-of select="/CheckoutMethod/NextPageUrl"></xsl:value-of>
            <xsl:text>');return false;</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="/CheckoutMethod/CompletedText"></xsl:value-of>
        </button>
      </div>
    </section>

  </xsl:template>

  <xsl:template match="Shipping">
    <div class="form-group">
      <input type="radio" name="ShippingMethod" onchange="AjaxCheckout.getshippingtotal(this)">
        <xsl:if test="position()=1">
          <xsl:attribute name="checked">
            <xsl:text>checked</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="value">
          <xsl:value-of select="Id"></xsl:value-of>
        </xsl:attribute>
      </input>
      <label>
        <xsl:value-of select="Title"></xsl:value-of>
      </label>
      <xsl:if test="Description!=''">
        <p class="des">
          <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
        </p>
      </xsl:if>
    </div>
  </xsl:template>
  
  <xsl:template match="Payment">
    <div class="payment-method">
      <div class="select-group">
        <input type="radio" name="PaymentMethod">
          <xsl:attribute name="id">
            <xsl:value-of select="Id"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="value">
            <xsl:value-of select="Id"></xsl:value-of>
          </xsl:attribute>
          <xsl:if test="position()=1">
            <xsl:attribute name="checked">
              <xsl:text>checked</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="value">
              <xsl:value-of select="Id"></xsl:value-of>
            </xsl:attribute>
          </xsl:if>
        </input>
        <label>
          <xsl:attribute name="for">
            <xsl:value-of select="Id"></xsl:value-of>
          </xsl:attribute>
          <p class="method-info">
            <xsl:if test="Description!=''">
              <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
            </xsl:if>
          </p>
        </label>
        <xsl:if test="Id=3">
          <div class="agree">
            <input id="PaymentAgree" type="checkbox" checked="checked" name="PaymentAgree" />
            <label for="PaymentAgree"><xsl:value-of select="/CheckoutMethod/IHaveReadText"></xsl:value-of></label>
          </div>
        </xsl:if>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>