<?xml version="1.0" encoding="UTF-8"?>

<!-- Odkaz na GITHUB: https://github.com/CubeBender/Path-of-Exile-XML -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text"/>
	
  <xsl:template match="settings">
    [
    "PoEversion":"2.6a",
    "Issue":"Missing minimap",
    "Users":{
    <xsl:for-each select="profile[ui/map_transparency >= 97]">
      <xsl:sort select="@user" order="descending"/>
      {
		    "user-name":"<xsl:value-of select="@user" />",
        "graphical-settings":{
        "adapter":"<xsl:value-of select="graphics/adapter"/>",
        "display-mode":"<xsl:value-of select="graphics/display_mode" />",
        "resolution":"<xsl:value-of select="graphics/resolution" />"
        },
        "ui-settings":{
          "map-shown":"<xsl:value-of select="ui/show_corner_map" />",
          "map-autocenter":"<xsl:value-of select="ui/auto-center_map" />",
          "map-transparency":"<xsl:value-of select="ui/map_transparency" />"
        }
      }<xsl:if test="position() != last()">,</xsl:if>
		  </xsl:for-each>
		  }
		]
  </xsl:template>
</xsl:stylesheet>