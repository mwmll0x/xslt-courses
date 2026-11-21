<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>

	<xsl:param name="teacher" select="'Борисов И.О.'"/>
	<xsl:param name="theme" select="'XML'"/>
	<xsl:param name="theme2" select="'XSLT'"/>

	<xsl:key name="teachers" match="teacher" use="."/>
	<xsl:key name="keywords" match="keyword" use="."/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Наши курсы</title>
			</head>
			<body>
				<h1>Наши курсы</h1>

				<h3>Курсы, которые читает <xsl:value-of select="$teacher"/></h3>
				<ul>
					<xsl:for-each select="key('teachers', $teacher)/../..">
						<li><xsl:value-of select="title"/></li>
					</xsl:for-each>
				</ul>

				<h3>Курсы, которые используют <xsl:value-of select="$theme"/></h3>
				<ul>
					<xsl:for-each select="key('keywords', $theme)/../..">
						<li><xsl:value-of select="title"/></li>
					</xsl:for-each>
				</ul>

				<h3>Курсы, которые читает <xsl:value-of select="$teacher"/>, и в которых есть тема <xsl:value-of select="$theme2"/></h3>
				<ul>
					<xsl:for-each select="key('teachers', $teacher)[../../keywords/keyword = $theme2]/../..">
						<li><xsl:value-of select="title"/></li>
					</xsl:for-each>
				</ul>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
