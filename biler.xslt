<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output omit-xml-declaration="yes" indent="yes"/>
 <xsl:strip-space elements="*"/>


 <xsl:template match="/">
  <xsl:copy-of select="document('biler.xml')/*"/>
 </xsl:template>
</xsl:stylesheet>