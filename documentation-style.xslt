<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:UML="omg.org/UML1.3">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <!-- <xsl:strip-space elements="*"/> -->


  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Dokuementasjon av FINT-informasjonsmodell</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"/>
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
      </head>
      <body>
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
              <ul class="nav nav-sidebar">
                <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
                <li><a href="#">Reports</a></li>
                <li><a href="#">Analytics</a></li>
                <li><a href="#">Export</a></li>
              </ul>
              <ul class="nav nav-sidebar">
                <li><a href="">Nav item</a></li>
                <li><a href="">Nav item again</a></li>
                <li><a href="">One more nav</a></li>
                <li><a href="">Another nav item</a></li>
                <li><a href="">More navigation</a></li>
              </ul>
              <ul class="nav nav-sidebar">
                <li><a href="">Nav item again</a></li>
                <li><a href="">One more nav</a></li>
                <li><a href="">Another nav item</a></li>
              </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
              <h1 class="page-header">Dashboard</h1>
              <xsl:apply-templates select="document('FINT-informasjonsmodell.xml')/XMI"/>
            </div>
          </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="XMI">
    
    <xsl:apply-templates select="//UML:Package" mode="packages-mode" />
    
      <!-- 
      <xsl:call-template name="packages">
        <xsl:with-param name="p" select="//UML:Package"/>
      </xsl:call-template>
      -->
    
  </xsl:template>
  
  <xsl:template match="//UML:Package" mode="packages-mode">
    <h2><xsl:value-of select="@name"/></h2>
    
    <i><xsl:value-of select="*/UML:TaggedValue[@tag='documentation']/@value"/></i>
    
    <xsl:apply-templates select="*/UML:Class" mode="class-mode" />
  </xsl:template>
  
  
  <xsl:template match="*/UML:Class" mode="class-mode">
      <h3>Class: <xsl:value-of select="@name"/></h3>
      <i><xsl:value-of select="*/UML:TaggedValue[@tag='documentation']/@value"/></i>

    <ul>
      <xsl:apply-templates select="*/UML:Attribute" mode="attrubute-mode"/>
    </ul>
  </xsl:template>  

  <xsl:template match="*/UML:Attribute" mode="attrubute-mode">
      <li><xsl:value-of select="@name"/></li>
      <i><xsl:value-of select="*/UML:TaggedValue[@tag='documentation']/@value"/></i>
  </xsl:template>    


</xsl:stylesheet>