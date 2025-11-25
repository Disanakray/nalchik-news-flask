<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Новости Нальчика (XSLT-демонстрация)</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            color: #333;
          }
          h1 {
            color: #003366;
            text-align: center;
          }
          .article {
            border: 1px solid #eee;
            padding: 16px;
            margin-bottom: 20px;
            border-radius: 6px;
          }
          .article img {
            max-width: 100%;
            height: auto;
            margin: 12px 0;
            border-radius: 4px;
          }
          .date {
            color: #666;
            font-size: 0.9em;
            margin-top: 8px;
          }
        </style>
      </head>
      <body>
        <h1>📰 Новости Нальчика</h1>
        <p><em>Преобразовано с помощью XSLT — сортировка по дате, поддержка изображений и множественных абзацев</em></p>

        <!-- Обработка и сортировка новостей -->
        <xsl:for-each select="news/article">
          <xsl:sort select="date" order="descending" data-type="text"/>
          <div class="article">
            <h2><xsl:value-of select="title"/></h2>

            <!-- Условное отображение изображения -->
            <xsl:if test="image">
              <img>
                <xsl:attribute name="src">
                  <xsl:value-of select="image"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                  <xsl:value-of select="title"/>
                </xsl:attribute>
              </img>
            </xsl:if>

            <!-- Обработка одного или нескольких тегов <content> -->
            <xsl:for-each select="content">
              <p><xsl:value-of select="."/></p>
            </xsl:for-each>

            <div class="date">
              <xsl:value-of select="date"/> — <em><xsl:value-of select="author"/></em>
            </div>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
