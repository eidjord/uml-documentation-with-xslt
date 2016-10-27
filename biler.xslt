<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:UML="omg.org/UML1.3">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <xsl:strip-space elements="*"/>


  <xsl:template match="/">
    <html>
      <head>
        <title>Dokuementasjon av FINT-informasjonsmodell</title>
      </head>
      <body>
        <xsl:apply-templates select="document('FINT-informasjonsmodell.xml')"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="XMI">
    <li>
      <xsl:copy-of select="//UML:Package/*"/>
    </li>
  </xsl:template>
  
</xsl:stylesheet>