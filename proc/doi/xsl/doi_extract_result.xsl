<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select=".//doi_record"/>
	</xsl:template>
	<xsl:template match="doi_record">
	<xsl:if test="@key">
		<xsl:value-of select="@key"/>|"<xsl:value-of select=".//doi" disable-output-escaping="yes"/>"|<xsl:choose><xsl:when test=".//doi!=''">doi</xsl:when><xsl:otherwise>nf</xsl:otherwise></xsl:choose><xsl:text>

</xsl:text>
</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>

