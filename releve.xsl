<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>relve</head>
            <body>
                <h2>Relevé Bancaire</h2>
                <ul>
                    <li> RIB : <xsl:value-of select="releve/@RIB"/></li>
                    <li>dateReleve : <xsl:value-of select="releve/dateReleve"/></li>
                    <li>solde : <xsl:value-of select="releve/solde"/></li>
                </ul>
                <xsl:for-each select="releve/operations">
                    
                    <h3>Liste des opérations</h3>
                    <ul>
                        <li> dateDebut : <xsl:value-of select="@dateDebut"/></li>
                        <li>dateFin : <xsl:value-of select="@dateFin"/></li>
                    </ul>
                    
                <table border="1" width="90%">
                    <tr>
                        <th>type</th>
                        <th>date</th>
                        <th>montant</th>
                        <th>description</th>
                    </tr>
                    <xsl:for-each select="operation">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                    <td colspan="2">total des opérations de débit</td>
                    <td colspan="2"><xsl:value-of select="count(operation[@type='DEBIT'])"/></td>
                    </tr>
                   <tr>
                    <td colspan="2">total des opérations de crédit</td>
                    <td colspan="2"><xsl:value-of select="count(operation[@type='CREDIT'])"/></td>
                   </tr>
                </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>