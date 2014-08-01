<<<<<<< HEAD
<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="tool_box">
		<xsl:variable name="show_requests" select="//varScieloOrg/requests" />
		<xsl:variable name="show_login" select="//varScieloOrg/show_login" />
		<xsl:variable name="show_send_by_email" select="//varScieloOrg/show_send_by_email" />
		<xsl:variable name="show_cited_scielo" select="//varScieloOrg/show_cited_scielo" />
		<xsl:variable name="show_cited_google" select="//varScieloOrg/show_cited_google" />
		<xsl:variable name="show_similar_in_scielo" select="//varScieloOrg/show_similar_in_scielo" />
		<xsl:variable name="show_similar_in_google" select="//varScieloOrg/show_similar_in_google" />
		<xsl:variable name="google_last_process" select="//varScieloOrg/google_last_process" />
		<xsl:variable name="show_article_references" select="//varScieloOrg/show_article_references" />
		<xsl:variable name="show_datasus" select="//varScieloOrg/show_datasus" />
		<xsl:variable name="services_comments" select="//varScieloOrg/services_comments" />
		<xsl:variable name="acron" select="//SIGLUM" />
		<xsl:variable name="commentCount" select="//commentCount" />
		<!--xsl:variable name="current_issn" select="//ARTICLE/ISSUEINFO/ISSN"/-->
		<xsl:variable name="current_issn" select="//SERIAL/ISSN"/>
		<xsl:variable name="allow_comments" select="document('../xml/allow_comment.xml')/COMMENT/ISSN[text() = $current_issn ]"/>
		
		<div id="toolBox">
			<h2 id="toolsSection">
				<xsl:choose>
					<xsl:when test=" $LANGUAGE = 'en' ">Services</xsl:when>
					<xsl:when test=" $LANGUAGE = 'pt' ">Servi�os</xsl:when>
					<xsl:when test=" $LANGUAGE = 'es' ">Servicios</xsl:when>
				</xsl:choose>
			</h2>
			<!--
			<textarea>
				<xsl:copy-of select="/" />
			</textarea>
			-->
			<form name="addToShelf" method="post" action="http://{$SCIELO_REGIONAL_DOMAIN}/applications/scielo-org/services/addArticleToShelf.php" target="mensagem">
				<input type="hidden" name="PID" value="{//SERIAL/CONTROLINFO/PAGE_PID}"/>
				<input type="hidden" name="url" value="{concat('http://',//SERIAL/CONTROLINFO/SCIELO_INFO/SERVER,'/applications/scielo-org/scielo.php?script=sci_arttext&amp;pid=',//SERIAL/CONTROLINFO/PAGE_PID,'&amp;lng=',$LANGUAGE,'&amp;nrm=',//SERIAL/CONTROLINFO/STANDARD,'&amp;tlng=',//SERIAL/ISSUE/ARTICLE/@TEXTLANG)}"/>
			</form>
			<form name="citedAlert" method="post" action="http://{$SCIELO_REGIONAL_DOMAIN}/applications/scielo-org/services/citedAlert.php" target="mensagem">
				<input type="hidden" name="PID" value="{//SERIAL/CONTROLINFO/PAGE_PID}"/>
				<input type="hidden" name="url" value="{concat('http://',//SERIAL/CONTROLINFO/SCIELO_INFO/SERVER,'/applications/scielo-org/scielo.php?script=sci_arttext&amp;pid=',//SERIAL/CONTROLINFO/PAGE_PID,'&amp;lng=',$LANGUAGE,'&amp;nrm=',//SERIAL/CONTROLINFO/STANDARD,'&amp;tlng=',//SERIAL/ISSUE/ARTICLE/@TEXTLANG)}"/>
			</form>
			<form name="accessAlert" method="post" action="http://{$SCIELO_REGIONAL_DOMAIN}/applications/scielo-org/services/accessAlert.php" target="mensagem">
				<input type="hidden" name="PID" value="{//SERIAL/CONTROLINFO/PAGE_PID}"/>
				<input type="hidden" name="url" value="{concat('http://',//SERIAL/CONTROLINFO/SCIELO_INFO/SERVER,'/applications/scielo-org/scielo.php?script=sci_arttext&amp;pid=',//SERIAL/CONTROLINFO/PAGE_PID,'&amp;lng=',$LANGUAGE,'&amp;nrm=',//SERIAL/CONTROLINFO/STANDARD,'&amp;tlng=',//SERIAL/ISSUE/ARTICLE/@TEXTLANG)}"/>
			</form>
			<ul>
				<xsl:if test="$show_login != 0">
					<xsl:choose>
						<xsl:when test="normalize-space(//USERINFO/@status) != normalize-space('logout') ">
							<li>
								<xsl:choose>
									<xsl:when test="$LANGUAGE = 'en' ">
										<a href="javascript:void(0);" onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240"); document.forms.addToShelf.submit();{$services//service[name="minhaColecao"]/call}' rel="nofollow"><img src="/img/en/iconSend2MyLibrary.gif"/>Add to My Collection</a>
									</xsl:when>
									<xsl:when test=" $LANGUAGE = 'pt' ">
										<a href="javascript:void(0);" onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240"); document.forms.addToShelf.submit();{$services//service[name="minhaColecao"]/call}' rel="nofollow"><img src="/img/en/iconSend2MyLibrary.gif"/>Adicionar � Minha Cole��o</a>
									</xsl:when>
									<xsl:when test=" $LANGUAGE = 'es' ">
										<a href="javascript:void(0);" onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240"); document.forms.addToShelf.submit();{$services//service[name="minhaColecao"]/call}' rel="nofollow"><img src="/img/en/iconSend2MyLibrary.gif"/>A�adir a mi colecci�n</a>
									</xsl:when>
								</xsl:choose>
							</li>
							<li>

								<xsl:choose>
									<xsl:when test=" $LANGUAGE = 'en' ">
										<a href="javascript:void(0);" onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240"); document.forms.citedAlert.submit();{$services//service[name="aviseMeCitado"]/call}' rel="nofollow"><img src="/img/en/iconAlert.gif" />Alert me when cited</a>
									</xsl:when>
									<xsl:when test=" $LANGUAGE = 'pt' ">
										<a href="javascript:void(0);" onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240"); document.forms.citedAlert.submit();{$services//service[name="aviseMeCitado"]/call}' rel="nofollow"><img src="/img/en/iconAlert.gif" />Avise-me quando for citado</a>
									</xsl:when>
									<xsl:when test=" $LANGUAGE = 'es' ">
										<a href="javascript:void(0);" onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240");document.forms.citedAlert.submit();{$services//service[name="aviseMeCitado"]/call}' rel="nofollow"><img src="/img/en/iconAlert.gif" />Alerteme cuando el art�culo es citado</a>
									</xsl:when>
								</xsl:choose>
							</li>
							<li>
								<xsl:choose>
									<xsl:when test=" $LANGUAGE = 'en' ">
										<a href="javascript:void(0);" onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240");document.forms.accessAlert.submit();{$services//service[name="envieMeEstatisticaAcesso"]/call}' rel="nofollow"><img src="/img/en/iconStatistics.gif"/>Send me access statistics</a>
									</xsl:when>
									<xsl:when test=" $LANGUAGE = 'pt' ">
										<a href="javascript:void(0);" onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240");document.forms.accessAlert.submit();{$services//service[name="envieMeEstatisticaAcesso"]/call}' rel="nofollow"><img src="/img/pt/iconStatistics.gif"/>Envie-me estatisticas de acesso</a>
									</xsl:when>
									<xsl:when test=" $LANGUAGE = 'es' ">
										<a href="javascript:void(0);" onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240");document.forms.accessAlert.submit();{$services//service[name="envieMeEstatisticaAcesso"]/call}' rel="nofollow"><img src="/img/es/iconStatistics.gif"/>Enviarme estad�sticas del acceso</a>
									</xsl:when>
								</xsl:choose>
							</li>
						</xsl:when>
						<xsl:when test="normalize-space(//USERINFO/@status) = normalize-space('logout') ">
							<xsl:choose>
								<xsl:when test=" $LANGUAGE = 'en' ">
									<li><a href="http://{$SCIELO_REGIONAL_DOMAIN}/applications/scielo-org/sso/loginScielo.php?lang={$LANGUAGE}" onClick="{$services//service[name='servicosCustomizados']/call}" rel="nofollow"><img src="/img/{$LANGUAGE}/iconLogin.gif"/>Custom services</a></li>
								</xsl:when>
								<xsl:when test=" $LANGUAGE = 'pt' ">
									<li><a href="http://{$SCIELO_REGIONAL_DOMAIN}/applications/scielo-org/sso/loginScielo.php?lang={$LANGUAGE}" onClick="{$services//service[name='servicosCustomizados']/call}" rel="nofollow"><img src="/img/{$LANGUAGE}/iconLogin.gif"/>Servi�os personalizados</a></li>
								</xsl:when>
								<xsl:when test=" $LANGUAGE = 'es' ">
									<li><a href="http://{$SCIELO_REGIONAL_DOMAIN}/applications/scielo-org/sso/loginScielo.php?lang={$LANGUAGE}" onClick="{$services//service[name='servicosCustomizados']/call}" rel="nofollow" ><img src="/img/{$LANGUAGE}/iconLogin.gif"/>Servicios customizados</a></li>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$services_comments != 0">
					<xsl:if test="string-length($allow_comments) !=  '0' ">					
					<li>
						<a>
						<xsl:attribute name="href">javascript: void(0);</xsl:attribute>
						<xsl:attribute name="onClick">window.open('http://<xsl:value-of select="concat(//SERVER,'/scieloOrg/php/wpPosts.php?pid=',//ARTICLE/@PID,'&amp;lang=',$LANGUAGE,'&amp;acron=',$acron)"/>','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes'); <xsl:value-of select="$services//service[name='comentarios']/call"/></xsl:attribute>
						<xsl:attribute name="rel">nofollow</xsl:attribute>
						<img src="/img/{$LANGUAGE}/iconComment.gif"/>						
						<xsl:choose>
							<xsl:when test="$LANGUAGE='en' "><xsl:value-of select="concat('Comments(',$commentCount,')')"/></xsl:when>
							<xsl:when test="$LANGUAGE='pt' "><xsl:value-of select="concat('Coment�rios(',$commentCount,')')"/></xsl:when>
							<xsl:when test="$LANGUAGE='es' "><xsl:value-of select="concat('Comentarios(',$commentCount,')')"/></xsl:when>
						</xsl:choose>
						</a>					
						</li>
				</xsl:if>
			</xsl:if>
					<xsl:if test="//ARTICLE/@PDF">
					<xsl:variable name="tlng" select="//ARTICLE/@TEXTLANG"/>
					<xsl:variable name="pdf_tlng">
						<xsl:choose>
							<xsl:when test="//LANGUAGES/PDF_LANGS[LANG=$tlng]">
								<xsl:value-of select="$tlng"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//LANGUAGES/PDF_LANGS/LANG"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<li>
						<a>
							<xsl:call-template name="AddScieloLink">
								<xsl:with-param name="seq" select="CONTROLINFO/PAGE_PID"/>
								<xsl:with-param name="script">sci_pdf</xsl:with-param>
								<xsl:with-param name="txtlang">
									<xsl:value-of select="$pdf_tlng"/>
								</xsl:with-param>
							</xsl:call-template>
							<img src="/img/{$LANGUAGE}/iconPDFDocument.gif"/>
							<xsl:choose>
								<xsl:when test="$LANGUAGE='en' ">Article in PDF format</xsl:when>
								<xsl:when test="$LANGUAGE='pt' ">Artigo em formato PDF</xsl:when>
								<xsl:when test="$LANGUAGE='es' ">Art�culo en el formato PDF</xsl:when>
							</xsl:choose>
						</a>
					</li>
				</xsl:if>
				<li>
					<a>
						<xsl:attribute name="href">http://<xsl:value-of select="concat(//SERVER,'/scieloOrg/php/articleXML.php?pid=',//ARTICLE/@PID,'&amp;lang=',$LANGUAGE)"/></xsl:attribute>
						<xsl:attribute name="rel">nofollow</xsl:attribute>
						<xsl:attribute name="target">xml</xsl:attribute>
						<xsl:if test="$service_log = 1"><xsl:attribute name="onClick">callUpdateArticleLog('artigo_em_formato_xml');</xsl:attribute></xsl:if>
						<img src="/img/{$LANGUAGE}/iconXMLDocument.gif"/>						
						<xsl:choose>
							<xsl:when test="$LANGUAGE='en' ">Article in XML  format</xsl:when>
							<xsl:when test="$LANGUAGE='pt' ">Artigo em formato XML  </xsl:when>
							<xsl:when test="$LANGUAGE='es' ">Art�culo en el formato XML  </xsl:when>
						</xsl:choose>
					</a>
				</li>
				<xsl:if test="($show_article_references = 1) and (//EMBARGO/@text='yes' or not(//EMBARGO))">
				<li>
					<a>
						<xsl:attribute name="href">javascript: void(0);</xsl:attribute>
						<xsl:attribute name="onClick">window.open('http://<xsl:value-of select="concat(//SERVER,'/scieloOrg/php/reference.php?pid=',//ARTICLE/@PID,'&amp;caller=',//SERVER,'&amp;lang=',$LANGUAGE)"/>','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes'); <xsl:value-of select="$services//service[name='referenciasArtigo']/call"/></xsl:attribute>
						<xsl:attribute name="rel">nofollow</xsl:attribute>
						<img src="/img/{$LANGUAGE}/iconReferences.gif"/>						
						<xsl:choose>
							<xsl:when test="$LANGUAGE='en' ">Article references</xsl:when>
							<xsl:when test="$LANGUAGE='pt' ">Refer�ncias do artigo</xsl:when>
							<xsl:when test="$LANGUAGE='es' ">Referencias del art�culo</xsl:when>
						</xsl:choose>
					</a>
				</li>
				</xsl:if>
				<xsl:if test="$show_datasus = 1 and (//ARTICLE/@AREASGEO != 0 and //ARTICLE/@AREASGEO != '')">
				<li>
					<a>
						<xsl:attribute name="href">javascript:void(0);</xsl:attribute>
						<xsl:attribute name="onClick">javascript: window.open('http://<xsl:value-of select="concat(//SERVER,'/scieloOrg/php/datasus.php?pid=',//ARTICLE/@PID,'&amp;caller=',//SERVER,'&amp;lang=',$LANGUAGE)"/>','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes'); <xsl:value-of select="$services//service[name='indicadoresSaude']/call"/></xsl:attribute>
						<xsl:attribute name="rel">nofollow</xsl:attribute>
						<img src="/img/{$LANGUAGE}/iconDATASUS.gif"/>
						<xsl:choose>
							<xsl:when test="$LANGUAGE='en' ">Health Indicators</xsl:when>
							<xsl:when test="$LANGUAGE='pt' ">Indicadores de Sa�de</xsl:when>
							<xsl:when test="$LANGUAGE='es' ">Indicadores de Salud</xsl:when>
						</xsl:choose>
						
					</a>
				</li>
				</xsl:if>
				

				<!-- Tirando o "buraco" que fica no IE qnd n�o tem curriculo LATES -->
				<xsl:if test="ISSUE/ARTICLE/LATTES/AUTHOR">
					<li>
						<xsl:apply-templates select="ISSUE/ARTICLE/LATTES"/>
					</li>
				</xsl:if>
				
				<li>
				<!-- How to cite this article -->
					<xsl:call-template name="PrintArticleInformationLink"/>
				</li>
				<!-- Requests -->
				<xsl:if test="$show_requests = 1">
					<li>
						<xsl:apply-templates select="//fulltext-service[@id='access']" mode="link"/>
					</li>
				</xsl:if>
				<xsl:if test="$show_cited_scielo = 1">
					<!-- Cited in SciELO -->
					<li>
						<xsl:apply-templates select="//fulltext-service[@id='cited_SciELO']" mode="linkCited"/>
					</li>
				</xsl:if>				
				<xsl:if test="$show_cited_google = 1">
					<!-- Cited in Google -->
					<li>
						<xsl:apply-templates select="//fulltext-service[@id='cited_Google']" mode="linkGoogle">
							<xsl:with-param name="google_last_process" select="$google_last_process"/>
						</xsl:apply-templates>
					</li>
				</xsl:if>
				<xsl:if test="$show_similar_in_scielo = 1">
					<!-- Related in Scielo-->
					<li>
						<xsl:apply-templates select="//fulltext-service[@id='related']" mode="linkRelated"/>
					</li>
				</xsl:if>
				<xsl:if test="$show_similar_in_google = 1">
					<!-- Related in Google-->
					<li>
						<xsl:apply-templates select="//fulltext-service[@id='related_Google']" mode="linkGoogle">
                               <xsl:with-param name="google_last_process" select="$google_last_process"/>
                                </xsl:apply-templates>
					</li>				
				</xsl:if>
				<xsl:if test="$show_send_by_email = 1">
					<li>
						<xsl:apply-templates select="//fulltext-service[@id='send_mail']" mode="link"/>
					</li>	
				</xsl:if>
			</ul>
		</div>
	</xsl:template>
	
	<xsl:template match="fulltext-service" mode="link">
		<xsl:variable name="params">
			<xsl:if test="@id='cited_Google' or @id='related_Google'">,menubar=1,location=1,toolbar=1,status=1,scrollbars=1,directories=1</xsl:if>
		</xsl:variable>
		<a href="javascript:void(0);" >	
			<xsl:attribute name="onclick">window.open('<xsl:value-of select="concat(url,'&amp;lang=',$LANGUAGE)"/>','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes,<xsl:value-of select="$params"/>');<xsl:if test="$service_log = 1">callUpdateArticleLog('<xsl:value-of select="@id"/>');</xsl:if></xsl:attribute>
<xsl:attribute name="rel">nofollow</xsl:attribute>
			<xsl:apply-templates select="." mode="label"/>
		</a>
	</xsl:template>

        <xsl:template match="fulltext-service" mode="linkGoogle">
		<xsl:param name="google_last_process"/>
                <xsl:variable name="params">
                        <xsl:if test="@id='cited_Google' or @id='related_Google'">,menubar=1,location=1,toolbar=1,status=1,scrollbars=1,directories=1</xsl:if>
                </xsl:variable>
		<xsl:choose>
                <xsl:when test="normalize-space(//ARTICLE/@PROCESSDATE) &lt; normalize-space($google_last_process)">
			<a href="javascript:void(0);" >
                                <xsl:attribute name="onclick">window.open('<xsl:value-of select="concat(url,'&amp;lang=',$LANGUAGE)"/>','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes,<xsl:value-of select="$params"/>');<xsl:if test="$service_log = 1">callUpdateArticleLog('<xsl:value-of select="@id"/>');</xsl:if></xsl:attribute>
<xsl:attribute name="rel">nofollow</xsl:attribute>
                                <xsl:apply-templates select="." mode="label"/>
                        </a>
                </xsl:when>
                <xsl:otherwise>
                        <xsl:apply-templates select="." mode="labelNotLinked"/>
                </xsl:otherwise>
                </xsl:choose>
        </xsl:template>


        <xsl:template match="fulltext-service" mode="linkRelated">
	        <xsl:variable name="params">
                	<xsl:if test="@id='cited_Google' or @id='related_Google'">,menubar=1,location=1,toolbar=1,status=1,scrollbars=1,directories=1</xsl:if>
        	</xsl:variable>
		<xsl:choose>
                <xsl:when test="//ARTICLE/@RELATED != '' and //ARTICLE/@RELATED != 0">
	                <a href="javascript:void(0);" >
                	        <xsl:attribute name="onclick">window.open('<xsl:value-of select="concat(url,'&amp;lang=',$LANGUAGE)"/>','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes,<xsl:value-of select="$params"/>');<xsl:if test="$service_log = 1">callUpdateArticleLog('<xsl:value-of select="@id"/>');</xsl:if></xsl:attribute>
<xsl:attribute name="rel">nofollow</xsl:attribute>
        	                <xsl:apply-templates select="." mode="label"/>
	                </a>
		</xsl:when>
		<xsl:otherwise>
                        <xsl:apply-templates select="." mode="labelNotLinked"/>
		</xsl:otherwise>
		</xsl:choose>
        </xsl:template>


        <xsl:template match="fulltext-service" mode="linkCited">
                <xsl:variable name="params">
                        <xsl:if test="@id='cited_Google' or @id='related_Google'">,menubar=1,location=1,toolbar=1,status=1,scrollbars=1,directories=1</xsl:if>
                </xsl:variable>
                
                <xsl:choose>
                <xsl:when test="//ARTICLE/@CITED != '' and //ARTICLE/@CITED != 0 ">
                        <a href="javascript:void(0);" >
                                <xsl:attribute name="onclick">window.open('<xsl:value-of select="concat(url,'&amp;lang=',$LANGUAGE)"/>','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes,<xsl:value-of select="$params"/>');<xsl:if test="$service_log = 1">callUpdateArticleLog('<xsl:value-of select="@id"/>');</xsl:if></xsl:attribute>
<xsl:attribute name="rel">nofollow</xsl:attribute>
                <xsl:apply-templates select="." mode="label"/>
                        </a>
                </xsl:when>
                <xsl:otherwise>
                        <xsl:apply-templates select="." mode="labelNotLinked"/>
                </xsl:otherwise>
                </xsl:choose>
        </xsl:template>

	
	<xsl:template match="fulltext-service[@id='access']" mode="label">
		<img src="/img/{$LANGUAGE}/iconStatistics.gif"/>	
		<xsl:choose>
			<xsl:when test=" $LANGUAGE = 'en' ">Requests</xsl:when>
			<xsl:when test=" $LANGUAGE = 'pt' ">Acessos</xsl:when>
			<xsl:when test=" $LANGUAGE = 'es' ">Accesos</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="cited" >
		<xsl:choose>
			<xsl:when test=" $LANGUAGE = 'en' "><img src="/img/{$LANGUAGE}/iconCitedOn.jpg" alt="{//ARTICLE/@CITED} article(s)"/>Cited by </xsl:when>
			<xsl:when test=" $LANGUAGE = 'pt' "><img src="/img/{$LANGUAGE}/iconCitedOn.jpg" alt="{//ARTICLE/@CITED} artigo(s)"/>Citado por </xsl:when>
			<xsl:when test=" $LANGUAGE = 'es' "><img src="/img/{$LANGUAGE}/iconCitedOn.jpg" alt="{//ARTICLE/@CITED} art�culo(s)"/>Citado por </xsl:when>
		</xsl:choose>
	</xsl:template>

        <xsl:template name="citedNotLinked">
                <xsl:choose>
                        <xsl:when test=" $LANGUAGE = 'en' "><img src="/img/{$LANGUAGE}/iconCitedOff.jpg" alt="have no cited articles"/>Cited by </xsl:when>
                        <xsl:when test=" $LANGUAGE = 'pt' "><img src="/img/{$LANGUAGE}/iconCitedOff.jpg" alt="n�o existem artigos citados"/>Citado por </xsl:when>
                        <xsl:when test=" $LANGUAGE = 'es' "><img src="/img/{$LANGUAGE}/iconCitedOff.jpg" alt="no hay art�culos citados"/>Citado por </xsl:when>
                </xsl:choose>
        </xsl:template>


        <xsl:template name="citedGoogle">
                <xsl:choose>
                        <xsl:when test=" $LANGUAGE = 'en' "><img src="/img/{$LANGUAGE}/iconcitedbygoogle.gif" alt="indexed by Google"/>Cited by </xsl:when>
                        <xsl:when test=" $LANGUAGE = 'pt' "><img src="/img/{$LANGUAGE}/iconcitedbygoogle.gif" alt="indexado pelo Google"/>Citado por </xsl:when>
                        <xsl:when test=" $LANGUAGE = 'es' "><img src="/img/{$LANGUAGE}/iconcitedbygoogle.gif" alt="indizado por Google"/>Citado por </xsl:when>
                </xsl:choose>
        </xsl:template>

        <xsl:template name="citedNotLinkedGoogle">
                <xsl:choose>
                        <xsl:when test=" $LANGUAGE = 'en' "><img src="/img/{$LANGUAGE}/iconCitedOff.jpg" alt="on index process"/>Cited by </xsl:when>
                        <xsl:when test=" $LANGUAGE = 'pt' "><img src="/img/{$LANGUAGE}/iconCitedOff.jpg" alt="em processo de indexa��o"/>Citado por </xsl:when>
                        <xsl:when test=" $LANGUAGE = 'es' "><img src="/img/{$LANGUAGE}/iconCitedOff.jpg" alt="en proceso de indizaci�n"/>Citado por </xsl:when>
                </xsl:choose>
        </xsl:template>


	<xsl:template match="fulltext-service[@id='cited_SciELO']" mode="label">
		<xsl:call-template name="cited" />
		SciELO
	</xsl:template>

        <xsl:template match="fulltext-service[@id='cited_SciELO']" mode="labelNotLinked">
                <xsl:call-template name="citedNotLinked" />
                SciELO
        </xsl:template>


	<xsl:template match="fulltext-service[@id='cited_Google']" mode="label">
		<xsl:call-template name="citedGoogle" />
		Google
	</xsl:template>

        <xsl:template match="fulltext-service[@id='cited_Google']" mode="labelNotLinked">
                <xsl:call-template name="citedNotLinkedGoogle" />
                Google
        </xsl:template>


	<xsl:template match="fulltext-service[@id='related']" mode="label">
		<xsl:choose>
			<xsl:when test=" $LANGUAGE = 'en' "><img src="/img/{$LANGUAGE}/iconRelatedOn.gif" alt="{//ARTICLE/@RELATED} article(s)"/>Similars in SciELO</xsl:when>
			<xsl:when test=" $LANGUAGE = 'pt' "><img src="/img/{$LANGUAGE}/iconRelatedOn.gif" alt="{//ARTICLE/@RELATED} artigo(s)"/>Similares em SciELO </xsl:when>
			<xsl:when test=" $LANGUAGE = 'es' "><img src="/img/{$LANGUAGE}/iconRelatedOn.gif" alt="{//ARTICLE/@RELATED} art�culo(s)"/>Similares en SciELO </xsl:when>
		</xsl:choose>
	</xsl:template>

        <xsl:template match="fulltext-service[@id='related']" mode="labelNotLinked">
                <xsl:choose>
                        <xsl:when test=" $LANGUAGE = 'en' "><img src="/img/{$LANGUAGE}/iconRelatedOff.jpg" alt="have no similar articles"/>Similars in SciELO </xsl:when>
                        <xsl:when test=" $LANGUAGE = 'pt' "><img src="/img/{$LANGUAGE}/iconRelatedOff.jpg" alt="N�o existem artigos similares"/>Similares em SciELO </xsl:when>
                        <xsl:when test=" $LANGUAGE = 'es' "><img src="/img/{$LANGUAGE}/iconRelatedOff.jpg" alt="No hay art�lculos similares"/>Similares en SciELO </xsl:when>
                </xsl:choose>
        </xsl:template>

	<xsl:template match="fulltext-service[@id='related_Google']" mode="label">
		<xsl:choose>
		   <xsl:when test=" $LANGUAGE = 'en' "><img src="/img/{$LANGUAGE}/iconRelatedOn.gif" alt="indexed by Google"/>Similars in Google</xsl:when>
		   <xsl:when test=" $LANGUAGE = 'pt' "><img src="/img/{$LANGUAGE}/iconRelatedOn.gif" alt="indexado pelo Google"/>Similares em Google</xsl:when>
		   <xsl:when test=" $LANGUAGE = 'es' "><img src="/img/{$LANGUAGE}/iconRelatedOn.gif" alt="indizado por Google"/>Similares en Google</xsl:when>
		</xsl:choose>
	</xsl:template>	

        <xsl:template match="fulltext-service[@id='related_Google']" mode="labelNotLinked">
                <xsl:choose>
                        <xsl:when test=" $LANGUAGE = 'en' "><img src="/img/{$LANGUAGE}/iconRelatedOff.jpg" alt="on index process"/>Similars in Google</xsl:when>
                        <xsl:when test=" $LANGUAGE = 'pt' "><img src="/img/{$LANGUAGE}/iconRelatedOff.jpg" alt="em processo de indexa��o"/>Similares em Google</xsl:when>
                        <xsl:when test=" $LANGUAGE = 'es' "><img src="/img/{$LANGUAGE}/iconRelatedOff.jpg" alt="en proceso de indizaci�n"/>Similares en Google</xsl:when>
                </xsl:choose>
        </xsl:template>


	<xsl:template match="fulltext-service[@id='send_mail']" mode="label">
		<img src="/img/{$LANGUAGE}/iconEmail.jpg"/>
		<xsl:choose>
			<xsl:when test=" $LANGUAGE = 'en' ">Send this article by e-mail</xsl:when>
			<xsl:when test=" $LANGUAGE = 'pt' ">Enviar este artigo por e-mail</xsl:when>
			<xsl:when test=" $LANGUAGE = 'es' ">Enviar este art�culo por e-mail</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
=======
<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="related_documents.xsl"/>
  <xsl:variable name="SHOW_NEW_ARTICLE_LINK" select="//show_new_article_link"/>

  <xsl:template name="tool_box">
    <xsl:variable name="show_requests" select="//varScieloOrg/requests"/>
    <xsl:variable name="refferer" select="//varScieloOrg/refferer"/>
    <xsl:variable name="show_login" select="//varScieloOrg/show_login"/>
    <xsl:variable name="show_send_by_email" select="//varScieloOrg/show_send_by_email"/>
    <xsl:variable name="show_cited_scielo" select="//varScieloOrg/show_cited_scielo"/>
    <xsl:variable name="show_cited_google" select="//varScieloOrg/show_cited_google"/>
    <xsl:variable name="show_similar_in_scielo" select="//varScieloOrg/show_similar_in_scielo"/>
    <xsl:variable name="show_similar_in_google" select="//varScieloOrg/show_similar_in_google"/>
    <xsl:variable name="google_last_process" select="//varScieloOrg/google_last_process"/>
    <xsl:variable name="show_article_references" select="//varScieloOrg/show_article_references"/>
    <xsl:variable name="show_datasus" select="//varScieloOrg/show_datasus"/>
    <xsl:variable name="services_comments" select="//varScieloOrg/services_comments"/>
    <xsl:variable name="show_article_wltranslation"
      select="//varScieloOrg/show_article_wltranslation"/>
    <xsl:variable name="show_semantic_hl" select="//varScieloOrg/show_semantic_hl"/>
    <xsl:variable name="show_ubio" select="//varScieloOrg/show_ubio"/>
    <xsl:variable name="acron" select="//SIGLUM"/>
    <xsl:variable name="commentCount" select="//commentCount"/>
    <xsl:variable name="current_issn" select="//SERIAL/ISSN_AS_ID"/>
    <xsl:variable name="allow_comments"
      select="document('../xml/allow_comment.xml')/COMMENT/ISSN[text() = $current_issn ]"/>
    <xsl:variable name="title_subjects" select="//TITLEGROUP/SUBJECT"/>
    <xsl:variable name="show_fapesp_projects" select="//varScieloOrg/show_fapesp_projects"/>
    <xsl:variable name="show_clinical_trials" select="//varScieloOrg/show_clinical_trials"/>
    <xsl:variable name="url_login" select="//varScieloOrg/url_login"/>
    <xsl:variable name="show_group_article" select="//varScieloOrg/show_group_article"/>
    <xsl:variable name="show_group_indicators" select="//varScieloOrg/show_group_indicators"/>
    <xsl:variable name="show_group_related_links" select="//varScieloOrg/show_group_related_links"/>
    <xsl:variable name="show_group_services" select="//varScieloOrg/show_group_services"/>
    <xsl:variable name="show_group_bookmark" select="//varScieloOrg/show_group_bookmark"/>
    <xsl:variable name="THIS_PAGE_URL" select="concat('http://',//SERIAL/CONTROLINFO/SCIELO_INFO/SERVER,'/scielo.php?script=sci_arttext%26pid=',//SERIAL/CONTROLINFO/PAGE_PID,'%26lng=',$LANGUAGE,'%26nrm=',//SERIAL/CONTROLINFO/STANDARD,'%26tlng=',//SERIAL/ISSUE/ARTICLE/@TEXTLANG)"/>

    <form name="addToShelf" method="post"
      action="http://{$SCIELO_REGIONAL_DOMAIN}/applications/scielo-org/services/addArticleToShelf.php"
      target="mensagem">
      <input type="hidden" name="PID" value="{//SERIAL/CONTROLINFO/PAGE_PID}"/>
      <input type="hidden" name="url"
        value="{$THIS_PAGE_URL}"
      />
    </form>
    <form name="citedAlert" method="post"
      action="http://{$SCIELO_REGIONAL_DOMAIN}/applications/scielo-org/services/citedAlert.php"
      target="mensagem">
      <input type="hidden" name="PID" value="{//SERIAL/CONTROLINFO/PAGE_PID}"/>
      <input type="hidden" name="url"
        value="{$THIS_PAGE_URL}"
      />
    </form>
    <form name="accessAlert" method="post"
      action="http://{$SCIELO_REGIONAL_DOMAIN}/applications/scielo-org/services/accessAlert.php"
      target="mensagem">
      <input type="hidden" name="PID" value="{//SERIAL/CONTROLINFO/PAGE_PID}"/>
      <input type="hidden" name="url"
        value="{$THIS_PAGE_URL}"
      />
    </form>

    <div id="group">

      <!-- MY SCIELO INICIO -->
      <xsl:if test="$show_login != 0">
        <div id="toolBox">
          <h2 id="toolsSection">
            <xsl:value-of select="$translations/xslid[@id='sci_toolbox']/text[@find='my_scielo']"/>
          </h2>
          <div id="box_content">
            <ul>
              <xsl:choose>
                <xsl:when test="normalize-space(//USERINFO/@status) != normalize-space('logout') ">
                  <li>
                    <a href="javascript:void(0);"
                      onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240"); document.forms.addToShelf.submit();{$services//service[name="minhaColecao"]/call}'
                      rel="nofollow">
                      <img src="/img/en/iconSend2MyLibrary.gif"/>
                      <xsl:value-of
                        select="$translations/xslid[@id='sci_toolbox']/text[@find='add_to_my_collection']"
                      />
                    </a>
                  </li>
                  <li>
                    <a href="javascript:void(0);"
                      onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240");document.forms.citedAlert.submit();{$services//service[name="aviseMeCitado"]/call}'
                      rel="nofollow">
                      <img src="/img/en/iconAlert.gif"/>
                      <xsl:value-of
                        select="$translations/xslid[@id='sci_toolbox']/text[@find='alert_me_when_cited']"
                      />
                    </a>
                  </li>
                  <li>
                    <a href="javascript:void(0);"
                      onclick='window.open("","mensagem","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=320,height=240");document.forms.accessAlert.submit();{$services//service[name="envieMeEstatisticaAcesso"]/call}'
                      rel="nofollow">
                      <img src="/img/es/iconStatistics.gif"/>
                      <xsl:value-of
                        select="$translations/xslid[@id='sci_toolbox']/text[@find='send_me_access_statistics']"
                      />
                    </a>
                  </li>
                </xsl:when>
                <xsl:when test="normalize-space(//USERINFO/@status) = normalize-space('logout') ">
                  <li>
                    <a
                      href="http://{$SCIELO_REGIONAL_DOMAIN}/apps/servicesplatform/client/controller/authentication/origin/{$url_login}"
                      onClick="{$services//service[name='servicosCustomizados']/call}"
                      rel="nofollow">
                      <img src="/img/{$LANGUAGE}/iconLogin.gif"/>
                      <xsl:value-of
                        select="$translations/xslid[@id='sci_toolbox']/text[@find='custom_services']"
                      />
                    </a>
                  </li>
                </xsl:when>
              </xsl:choose>
            </ul>
          </div>
        </div>
      </xsl:if>
      <!-- MY SCIELO FIM -->

      <!-- SERVICES ON DEMAND INICIO -->
      <div id="toolBox">
        <h2 id="toolsSection">
          <xsl:value-of
            select="$translations/xslid[@id='sci_toolbox']/text[@find='personal_services']"/>
        </h2>
        <!-- SECTION ARTICLE INICIO -->
        <xsl:if test="$show_group_article != 0">

          <div class="toolBoxSection">
            <h2 class="toolBoxSectionh2">
              <xsl:value-of select="$translations/xslid[@id='sci_toolbox']/text[@find='article']"/>
            </h2>
          </div>

          <div class="box">
            <ul>

              <!-- ARTICLO IN PDF INICIO-->
              <xsl:variable name="tlng" select="//ARTICLE/@TEXTLANG"/>

              <xsl:if test="//CONTROLINFO/PAGE_NAME='sci_arttext'">
                <xsl:if test="//LANGUAGES/ART_TEXT_LANGS//LANG">
                  <li>
                      <img src="/img/fulltxt.gif"/>
                      <xsl:value-of select="$translations/xslid[@id='sci_issuetoc']/text[@find='full']"/>
                      <xsl:if test="$tlng!=//ARTICLE/@ORIGINALLANG">
                        <xsl:apply-templates select="//ARTICLE/@ORIGINALLANG"
                          mode="display-link-to-article-version">
                          <xsl:with-param name="pid" select="CONTROLINFO/PAGE_PID"/>
                          <xsl:with-param name="script" select="CONTROLINFO/PAGE_NAME"/>
                          <xsl:with-param name="icon"></xsl:with-param>
                          <xsl:with-param name="label"/>
                        </xsl:apply-templates>                         
                        <xsl:if test="//LANGUAGES/ART_TEXT_LANGS//LANG[.!=$tlng]">
                          | 
                        </xsl:if>
                      </xsl:if>
                      <xsl:apply-templates select="//LANGUAGES/ART_TEXT_LANGS//LANG[.!=$tlng]"
                        mode="display-link-to-article-version">
                        <xsl:with-param name="pid" select="CONTROLINFO/PAGE_PID"/>
                        <xsl:with-param name="script" select="CONTROLINFO/PAGE_NAME"/>
                        <xsl:with-param name="icon"></xsl:with-param>
                        <xsl:with-param name="label"/>
                      </xsl:apply-templates>                     
                  </li>                
                </xsl:if>
                <xsl:if test="$SHOW_NEW_ARTICLE_LINK='1'">
                  <xsl:choose>
                    <xsl:when test=".//BODY"/>
                    <xsl:when test=".//fulltext/front"/>
                    <xsl:otherwise>
                      <li>
                        <!--xsl:apply-templates
                          select="//ARTICLE/@ORIGINALLANG | //LANGUAGES/ART_TEXT_LANGS//LANG "
                          mode="display-link-to-new-article-version"-->
                        <xsl:apply-templates
                          select="//LANGUAGES/ART_TEXT_LANGS//LANG[.=$tlng] | //ARTICLE/@ORIGINALLANG[.=$tlng]"
                          mode="display-link-to-new-article-version">
                          <xsl:with-param name="pid" select="CONTROLINFO/PAGE_PID"/>
                          <xsl:with-param name="icon">/img/fulltxt.gif</xsl:with-param>
                          <xsl:with-param name="label">
                            <xsl:choose>
                              <xsl:when test="$interfaceLang='en'">text new page (beta)</xsl:when>
                              <xsl:when test="$interfaceLang='es'">nueva p&#225;gina del texto (beta)</xsl:when>
                              <xsl:when test="$interfaceLang='pt'">nova p&#225;gina do texto(beta)</xsl:when>
                            </xsl:choose>
                          </xsl:with-param>

                        </xsl:apply-templates>

                      </li>
                    </xsl:otherwise>
                  </xsl:choose>

                </xsl:if>
              </xsl:if>
              <xsl:if test="//ARTICLE/@PDF">
                <li>
                  <xsl:apply-templates select="//LANGUAGES/PDF_LANGS/LANG"
                    mode="display-link-to-article-version">
                    <xsl:with-param name="pid" select="CONTROLINFO/PAGE_PID"/>
                    <xsl:with-param name="script">sci_pdf</xsl:with-param>
                    <xsl:with-param name="icon">/img/en/iconPDFDocument.gif</xsl:with-param>
                    <xsl:with-param name="label"
                      select="$translations/xslid[@id='sci_issuetoc']/text[@find='pdf']"/>
                  </xsl:apply-templates>
                </li>
              </xsl:if>
              <!-- ARTICLO IN PDF FIM-->
              <!-- readcube -->
              <xsl:if test="//show_readcube = 1 and //ARTICLE/@DOI">
                  <li>
                      <img src="/img/readcube.png" width="21" heigth="21" />
                    <a>
                      <xsl:attribute name="href">http://www.readcube.com/articles/<xsl:value-of select="//ARTICLE/@DOI" />?tab=summary</xsl:attribute>
                      <xsl:attribute name="target">_blank</xsl:attribute>
                      ReadCube
                    </a>
                 </li>
              </xsl:if>
              <!-- ARTICLO IN XML INICIO-->
              <li>
                <a>
                  <xsl:attribute name="href">http://<xsl:value-of
                      select="concat(//SERVER,'/scieloOrg/php/articleXML.php?pid=',//ARTICLE/@PID,'&amp;lang=',$LANGUAGE)"
                    /></xsl:attribute>
                  <xsl:attribute name="rel">nofollow</xsl:attribute>
                  <xsl:attribute name="target">xml</xsl:attribute>
                  <xsl:if test="$service_log = 1">
                    <xsl:attribute name="onClick"
                      >callUpdateArticleLog('artigo_em_formato_xml');</xsl:attribute>
                  </xsl:if>
                  <img src="/img/{$LANGUAGE}/iconXMLDocument.gif"/>
                  <xsl:value-of
                    select="$translations/xslid[@id='sci_toolbox']/text[@find='article_in_xml_format']"
                  />
                </a>
              </li>
              <!-- ARTICLO IN XML FIM-->

              <!-- REFERENCE OF ARTICLE INICIO-->
              <xsl:if
                test="($show_article_references = 1) and (//EMBARGO/@text='yes' or not(//EMBARGO))">
                <li>
                  <a>
                    <xsl:attribute name="href">javascript: void(0);</xsl:attribute>
                    <xsl:attribute name="onClick">window.open('http://<xsl:value-of
                        select="concat(//SERVER,'/scieloOrg/php/reference.php?pid=',//ARTICLE/@PID,'&amp;caller=',//SERVER,'&amp;lang=',$LANGUAGE)"
                      />','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes');
                        <xsl:value-of select="$services//service[name='referenciasArtigo']/call"
                      /></xsl:attribute>
                    <xsl:attribute name="rel">nofollow</xsl:attribute>
                    <img src="/img/{$LANGUAGE}/iconReferences.gif"/>
                    <xsl:value-of
                      select="$translations/xslid[@id='sci_toolbox']/text[@find='article_references']"
                    />
                  </a>
                </li>
              </xsl:if>
              <!-- REFERENCE OF ARTICLE FIM-->

              <!-- HOW TO CITE THIS ARTICLE INICIO-->
              <li>
                <xsl:call-template name="PrintArticleInformationLink"/>
              </li>
              <!-- HOW TO CITE THIS ARTICLE FIM-->
              <script language="javascript" src="article.js"/>
              <!-- CURRICULUM SCIENTI INICIO-->
              <xsl:if test="ISSUE/ARTICLE/LATTES/AUTHOR">
                <li>
                  <xsl:apply-templates select="ISSUE/ARTICLE/LATTES"/>
                </li>
              </xsl:if>
              <!-- CURRICULUM SCIENTI FIM-->

              <!-- COMMENTS SCIELO INICIO -->
              <xsl:if test="$services_comments != 0">
                <xsl:if test="string-length($allow_comments) !=  '0' ">
                  <li>
                    <a>
                      <xsl:attribute name="href">javascript: void(0);</xsl:attribute>
                      <xsl:attribute name="onClick">window.open('http://<xsl:value-of
                          select="concat(//SERVER,'/scieloOrg/php/wpPosts.php?pid=',//ARTICLE/@PID,'&amp;lang=',$LANGUAGE,'&amp;acron=',$acron)"
                        />','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes');
                          <xsl:value-of select="$services//service[name='comentarios']/call"
                        /></xsl:attribute>
                      <xsl:attribute name="rel">nofollow</xsl:attribute>
                      <img src="/img/{$LANGUAGE}/iconComment.gif"/>
                      <xsl:value-of
                        select="$translations/xslid[@id='sci_toolbox']/text[@find='comments']"/>
                        (<xsl:value-of select="$commentCount"/>) </a>
                  </li>
                </xsl:if>
              </xsl:if>
              <!-- COMMENTS SCIELO FIM -->

              <!-- TRANSLATION SERVICES INICIO -->
              <xsl:if test="($show_article_wltranslation = 1)">
                <xsl:variable name="textlang">
                  <xsl:choose>
                    <xsl:when test="//PAGE_NAME='sci_arttext' ">
                      <xsl:value-of select="//ISSUE/ARTICLE/@TEXTLANG"/>
                    </xsl:when>
                    <xsl:when test="//PAGE_NAME='sci_abstract'">
                      <xsl:value-of select="//ABSTRACT/@xml:lang"/>
                    </xsl:when>
                  </xsl:choose>
                </xsl:variable>
                <li>
                  <a>
                    <xsl:attribute name="href">javascript: void(0);</xsl:attribute>
                    <xsl:attribute name="onClick">window.open('http://<xsl:value-of
                        select="concat(//SERVER,'/scieloOrg/php/translate.php?pid=',//ARTICLE/@PID,'&amp;caller=',//SERVER,'&amp;lang=',$LANGUAGE,'&amp;tlang=',//ISSUE/ARTICLE/@TEXTLANG,'&amp;script=',//PAGE_NAME)"
                      />','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes');
                        <xsl:value-of select="$services//service[name='referenciasArtigo']/call"
                      /></xsl:attribute>
                    <xsl:attribute name="rel">nofollow</xsl:attribute>
                    <img src="/img/{$LANGUAGE}/iconTranslation.gif"/>
                    <xsl:value-of
                      select="$translations/xslid[@id='sci_toolbox']/text[@find='automatic_translation']"
                    />
                  </a>
                </li>
              </xsl:if>
              <!-- TRANSLATION SERVICES FIM -->

              <!-- SEMANTIC HIGHLIGHTS INICIO -->
              <xsl:if test="($show_semantic_hl = 1)">
                <xsl:if test="//ARTICLE/@TEXTLANG='en' or //ABSTRACT/@xml:lang='en'">
                  <xsl:if
                    test="$title_subjects = 'HEALTH SCIENCES' or $title_subjects = 'BIOLOGICAL SCIENCES'">
                    <li>
                      <xsl:apply-templates select="//fulltext-service[@id='semantic_highlights']"
                        mode="semanticHighlights"/>
                    </li>
                  </xsl:if>
                </xsl:if>
              </xsl:if>
              <!-- SEMANTIC HIGHLIGHTS FIM -->

              <!-- SEND BY E-MAIL INICIO -->
              <xsl:if test="$show_send_by_email = 1">
                <li>
                  <xsl:apply-templates select="//fulltext-service[@id='send_mail']" mode="link"/>
                </li>
              </xsl:if>
              <!-- SEND BY E-MAIL FIM -->
            </ul>
          </div>
        </xsl:if>
        <!-- SECTION ARTICLE FIM -->

        <!-- SECTION INDICATORS INICIO -->
        <xsl:if test="$show_group_indicators != 0">
          <div class="toolBoxSection">
            <h2 class="toolBoxSectionh2">
              <xsl:value-of select="$translations/xslid[@id='sci_toolbox']/text[@find='indicators']"
              />
            </h2>
          </div>
          <div class="box">
            <ul>

              <!-- DATASUS LATTES CV INICIO -->
              <xsl:if
                test="$show_datasus = 1 and (//ARTICLE/@AREASGEO != 0 and //ARTICLE/@AREASGEO != '')">
                <li>
                  <a>
                    <xsl:attribute name="href">javascript:void(0);</xsl:attribute>
                    <xsl:attribute name="onClick">javascript: window.open('http://<xsl:value-of
                        select="concat(//SERVER,'/scieloOrg/php/datasus.php?pid=',//ARTICLE/@PID,'&amp;caller=',//SERVER,'&amp;lang=',$LANGUAGE)"
                      />','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes');
                        <xsl:value-of select="$services//service[name='indicadoresSaude']/call"
                      /></xsl:attribute>
                    <xsl:attribute name="rel">nofollow</xsl:attribute>
                    <img src="/img/{$LANGUAGE}/iconDATASUS.gif"/>
                    <xsl:value-of
                      select="$translations/xslid[@id='sci_toolbox']/text[@find='health_indicators']"
                    />
                  </a>
                </li>
              </xsl:if>
              <!-- DATASUS LATTES CV FIM -->

              <!-- CITED SCIELO INICIO -->
              <xsl:if test="$show_cited_scielo = 1">
                <li>
                  <xsl:apply-templates select="//fulltext-service[@id='cited_SciELO']"
                    mode="linkCited"/>
                </li>
              </xsl:if>
              <!-- CITED SCIELO FIM -->

              <!-- REQUESTS GRAFICS INICIO-->
              <xsl:if test="$show_requests = 1">
                <li>
                  <xsl:apply-templates select="//fulltext-service[@id='access']" mode="link"/>
                </li>
              </xsl:if>
              <!-- REQUESTS GRAFICS FIM-->

              <!-- CLINICAL TRIALS INICIO -->
              <xsl:if
                test="$show_clinical_trials = 1 and (normalize-space(//ARTICLE/@CLINICALTRIALS) != normalize-space(0))">
                <a>
                  <xsl:choose>
                    <xsl:when
                      test="normalize-space(//ARTICLE/@CLINICALTRIALS) != normalize-space(1)">
                      <xsl:attribute name="href">javascript:void(0);</xsl:attribute>
                      <xsl:attribute name="onClick">javascript: window.open('http://<xsl:value-of
                          select="concat(//SERVER,'/scieloOrg/php/clinicaltrials.php?pid=',//ARTICLE/@PID,'&amp;lang=',$LANGUAGE)"
                        />','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes');</xsl:attribute>
                      <xsl:attribute name="rel">nofollow</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="normalize-space(//ARTICLE/@CLINICALTRIALS) = normalize-space(1)">
                      <xsl:attribute name="href">
                        <xsl:value-of select="//CLINICALTRIALS/trial/@url"/>
                      </xsl:attribute>
                      <xsl:attribute name="target">_blank</xsl:attribute>
                    </xsl:when>
                  </xsl:choose>
                  <img src="/img/{$LANGUAGE}/iconClinicalTrials.gif"/>
                  <xsl:value-of
                    select="$translations/xslid[@id='sci_toolbox']/text[@find='clinical_trial']"/>
                </a>
              </xsl:if>
              <!-- CLINICAL TRIALS FIM -->
              <xsl:if test="//show_altmetrics = 1 and //ARTICLE/@DOI">
                  <div>
                      <script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script>
                      <div class='altmetric-embed' data-badge-type='4' data-doi='{//ARTICLE/@DOI}'></div>
                 </div>
              </xsl:if>
              
            </ul>
          </div>
        </xsl:if>
        <!-- SECTION INDICATORS FIM -->

        <!-- SECTION RELATED LINKS INICIO -->
        <xsl:if test="$show_group_related_links != 0">
          <div class="toolBoxSection">
            <h2 class="toolBoxSectionh2">
              <xsl:value-of
                select="$translations/xslid[@id='sci_toolbox']/text[@find='related_links']"/>
            </h2>
          </div>
          <div class="box">
            <ul>

              <!-- CITED GOOGLE INICIO -->
              <xsl:if test="$show_cited_google = 1">
                <li>
                  <xsl:apply-templates select="//fulltext-service[@id='cited_Google']"
                    mode="linkGoogle">
                    <xsl:with-param name="google_last_process" select="$google_last_process"/>
                  </xsl:apply-templates>
                </li>
              </xsl:if>
              <!-- CITED GOOGLE FIM -->

              <!-- SIMILAR IN SCIELO INICIO -->
              <xsl:if test="$show_similar_in_scielo = 1">
                <li>
                  <xsl:apply-templates select="//fulltext-service[@id='related']" mode="linkRelated"
                  />
                </li>
              </xsl:if>
              <!-- SIMILAR IN SCIELO FIM -->

              <!-- SIMILAR IN GOOGLE INICIO -->
              <xsl:if test="$show_similar_in_google = 1">
                <li>
                  <xsl:apply-templates select="//fulltext-service[@id='related_Google']"
                    mode="linkGoogle">
                    <xsl:with-param name="google_last_process" select="$google_last_process"/>
                  </xsl:apply-templates>
                </li>
              </xsl:if>
              <!-- SIMILAR IN GOOGLE FIM -->

              <!-- RELATED DOCUMENTS INICIO -->
              <xsl:apply-templates select=".//ARTICLE" mode="related-documents"/>
              <!-- RELATED DOCUMENTS FIM -->

              <!-- FAPESP INICIO-->
              <xsl:if
                test="$show_fapesp_projects = '1' and (//ARTICLE/@PROJFAPESP != '0' and //ARTICLE/@PROJFAPESP != '')">
                <li>
                  <a>
                    <xsl:choose>
                      <xsl:when test="normalize-space(//ARTICLE/@PROJFAPESP) != normalize-space(1)">
                        <xsl:attribute name="href">javascript:void(0);</xsl:attribute>
                        <xsl:attribute name="onClick">javascript: window.open('http://<xsl:value-of
                            select="concat(//SERVER,'/scieloOrg/php/projfapesp.php?pid=',//ARTICLE/@PID,'&amp;lang=',$LANGUAGE)"
                          />','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes');</xsl:attribute>
                        <xsl:attribute name="rel">nofollow</xsl:attribute>
                      </xsl:when>
                      <xsl:when test="normalize-space(//ARTICLE/@PROJFAPESP) = normalize-space(1)">
                        <xsl:attribute name="href">
                          <xsl:value-of select="//FAPESP/PROJETO/url"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">_blank</xsl:attribute>
                      </xsl:when>
                    </xsl:choose>
                    <img src="/img/{$LANGUAGE}/iconProjFapesp.gif"/>
                    <xsl:value-of
                      select="$translations/xslid[@id='sci_toolbox']/text[@find='fapesp_projects']"
                    />
                  </a>
                </li>
              </xsl:if>
              <!-- FAPESP FIM-->

              <!-- uBio -->
              <xsl:if test="$show_ubio = 1">
                <xsl:if test="$title_subjects = 'BIOLOGICAL SCIENCES'">
                  <li>
                    <a href="javascript:void(0);">
                      <xsl:attribute name="onclick"> window.open('<xsl:value-of
                          select="concat(//fulltext-service[@id='ubio']/url,$refferer)"/>') </xsl:attribute>
                      <img src="/img/btubio.png" border="0" width="21px" heigth="21px"/> uBio </a>
                  </li>
                </xsl:if>
              </xsl:if>
              <!-- FIM uBio -->
            </ul>
          </div>
        </xsl:if>
        <!-- SECTION RELATED LINKS FIM -->

        <!-- SECTION BOOKMARK INICIO -->
        <xsl:if test="$show_group_bookmark != 0">
          <div class="toolBoxSection">
            <h2 class="toolBoxSectionh2">
              <xsl:choose>
                <xsl:when test="$LANGUAGE='pt'">Compartilhar</xsl:when>
                <xsl:when test="$LANGUAGE='es'">Compartir</xsl:when>
                <xsl:when test="$LANGUAGE='en'">Share</xsl:when>
              </xsl:choose>
            </h2>
          </div>
          <div class="box">
            <ul>
              <li>
                <!-- AddThis Button BEGIN -->
                <div class="addthis_toolbox addthis_default_style">
                  <a class="addthis_button_delicious"/>
                  <a class="addthis_button_google"/>
                  <a class="addthis_button_twitter"/>
                  <a class="addthis_button_digg"/>
                  <a class="addthis_button_citeulike"/>                  
                  <a class="addthis_button_connotea"/>
                  <a href="http://www.mendeley.com/import/?url={$THIS_PAGE_URL}">
                    <xsl:attribute name="title"><xsl:choose>
                      <xsl:when test="$LANGUAGE='pt'">Mendeley</xsl:when>
                      <xsl:when test="$LANGUAGE='es'">Mendeley</xsl:when>
                      <xsl:when test="$LANGUAGE='en'">Mendeley</xsl:when>
                    </xsl:choose></xsl:attribute>
                    <img src="http://www.mendeley.com/graphics/mendeley.png"/></a>
                  
                  <a
                    href="http://www.addthis.com/bookmark.php?v=250&amp;username=xa-4c347ee4422c56df"
                    class="addthis_button_expanded">
                    <xsl:value-of
                      select="$translations/xslid[@id='sci_toolbox']/text[@find='bookmark_more']"/>
                  </a>
                </div>
                <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4c347ee4422c56df"/>
                <!-- AddThis Button END -->
              </li>
              <li><div class="addthis_toolbox addthis_default_style">
                
                <a
                  href="http://www.addthis.com/bookmark.php?v=250&amp;username=xa-4c347ee4422c56df"
                  class="addthis_button_expanded">
                  <xsl:value-of
                    select="$translations/xslid[@id='sci_toolbox']/text[@find='bookmark_more']"/>
                </a>
              </div></li><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4c347ee4422c56df"/>
              
            </ul>
          </div>
        </xsl:if>
        <!-- SECTION BOOKMARK INICIO -->
        <hr/>
        <ul>
          <li>
            <a id="permalink" href="javascript:void(0);"><img src="/img/common/iconPermalink.gif"
              />Permalink</a>
          </li>
        </ul>
      </div>
      <div id="permalink_box"
        style="margin-left:20px;background-color:#F2F2F2;border: 1px solid #CCC;display:none;position:absolute;z-index:1;padding:2px 10px 10px 10px;">
        <div style="text-align:right;">
          <img src="/img/common/icon-close.png" onClick="$('#permalink_box').toggle();"/>
        </div>
        <input type="text" name="short-url" id="short-url"/>
      </div>
    </div>
  </xsl:template>


  <xsl:template match="fulltext-service" mode="link">
    <xsl:variable name="params">
      <xsl:if test="@id='cited_Google' or @id='related_Google'"
        >,menubar=1,location=1,toolbar=1,status=1,scrollbars=1,directories=1</xsl:if>
    </xsl:variable>
    <a href="javascript:void(0);">
      <xsl:attribute name="onclick">window.open('<xsl:value-of
          select="concat(url,'&amp;lang=',$LANGUAGE)"
          />','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes,<xsl:value-of
          select="$params"/>');<xsl:if test="$service_log = 1">callUpdateArticleLog('<xsl:value-of
            select="@id"/>');</xsl:if></xsl:attribute>
      <xsl:attribute name="rel">nofollow</xsl:attribute>
      <xsl:apply-templates select="." mode="label"/>
    </a>
  </xsl:template>

  <xsl:template match="fulltext-service" mode="semanticHighlights">
    <xsl:variable name="show">
      <xsl:value-of
        select="$translations/xslid[@id='sci_toolbox']/text[@find='show_semantic_highlights']"/>
    </xsl:variable>
    <xsl:variable name="hide">
      <xsl:value-of
        select="$translations/xslid[@id='sci_toolbox']/text[@find='hide_semantic_highlights']"/>
    </xsl:variable>
    <xsl:variable name="serviceUrl">
      <xsl:value-of select="url"/>&amp;showlabel=<xsl:value-of select="$show"
        />&amp;hidelabel=<xsl:value-of select="$hide"/>
    </xsl:variable>
    <script src="{$serviceUrl}"/>
    <img id="wikifier-conceptweblinker-image" src="/img/btknewco.gif" onclick="WikiProfClick();"
      align="absmiddle"/>
    <a id="wikifier-conceptweblinker-button" href="#" title="Knewco's ConceptWeb Linker Button">
      <xsl:value-of select="$show"/>
    </a>
  </xsl:template>

  <xsl:template match="fulltext-service" mode="linkGoogle">
    <xsl:param name="google_last_process"/>
    <xsl:variable name="params">
      <xsl:if test="@id='cited_Google' or @id='related_Google'"
        >,menubar=1,location=1,toolbar=1,status=1,scrollbars=1,directories=1</xsl:if>
    </xsl:variable>
    <xsl:choose>
      <xsl:when
        test="normalize-space(//ARTICLE/@PROCESSDATE) &lt; normalize-space($google_last_process)">
        <a href="javascript:void(0);">
          <xsl:attribute name="onclick">window.open('<xsl:value-of
              select="concat(url,'&amp;lang=',$LANGUAGE)"
              />','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes,<xsl:value-of
              select="$params"/>');<xsl:if test="$service_log = 1"
                >callUpdateArticleLog('<xsl:value-of select="@id"/>');</xsl:if></xsl:attribute>
          <xsl:attribute name="rel">nofollow</xsl:attribute>
          <xsl:apply-templates select="." mode="label"/>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="labelNotLinked"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="fulltext-service" mode="linkRelated">
    <xsl:variable name="params">
      <xsl:if test="@id='cited_Google' or @id='related_Google'"
        >,menubar=1,location=1,toolbar=1,status=1,scrollbars=1,directories=1</xsl:if>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="//ARTICLE/@RELATED != '' and //ARTICLE/@RELATED != 0">
        <a href="javascript:void(0);">
          <xsl:attribute name="onclick">window.open('<xsl:value-of
              select="concat(url,'&amp;lang=',$LANGUAGE)"
              />','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes,<xsl:value-of
              select="$params"/>');<xsl:if test="$service_log = 1"
                >callUpdateArticleLog('<xsl:value-of select="@id"/>');</xsl:if></xsl:attribute>
          <xsl:attribute name="rel">nofollow</xsl:attribute>
          <xsl:apply-templates select="." mode="label"/>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="labelNotLinked"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="fulltext-service" mode="linkCited">
    <xsl:variable name="params">
      <xsl:if test="@id='cited_Google' or @id='related_Google'"
        >,menubar=1,location=1,toolbar=1,status=1,scrollbars=1,directories=1</xsl:if>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="//ARTICLE/@CITED != '' and //ARTICLE/@CITED != 0">
        <a href="javascript:void(0);">
          <xsl:attribute name="onclick">window.open('<xsl:value-of
              select="concat(url,'&amp;lang=',$LANGUAGE)"
              />','','width=640,height=480,resizable=yes,scrollbars=1,menubar=yes,<xsl:value-of
              select="$params"/>');<xsl:if test="$service_log = 1"
                >callUpdateArticleLog('<xsl:value-of select="@id"/>');</xsl:if></xsl:attribute>
          <xsl:attribute name="rel">nofollow</xsl:attribute>
          <xsl:apply-templates select="." mode="label"/>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="labelNotLinked"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="fulltext-service[@id='access']" mode="label">
    <img src="/img/{$LANGUAGE}/iconStatistics.gif"/>
    <xsl:value-of select="$translations/xslid[@id='sci_toolbox']/text[@find='access']"/>
  </xsl:template>

  <xsl:template name="cited">
    <img src="/img/{$LANGUAGE}/iconCitedOn.gif" alt="{//ARTICLE/@CITED} art�culo(s)"/>
    <xsl:value-of select="$translations/xslid[@id='sci_toolbox']/text[@find='cited_by']"/>
  </xsl:template>

  <xsl:template name="citedNotLinked">
    <img src="/img/{$LANGUAGE}/iconCitedOff.gif"
      alt="{$translations/xslid[@id='sci_toolbox']/text[@find='have_no_cited_article']}"/>
    <xsl:value-of select="$translations/xslid[@id='sci_toolbox']/text[@find='cited_by']"/>
  </xsl:template>


  <xsl:template name="citedGoogle">
    <img src="/img/{$LANGUAGE}/iconCitedGoogleOn.gif"
      alt="{$translations/xslid[@id='sci_toolbox']/text[@find='indexed_by_google']}"/>
    <xsl:value-of select="$translations/xslid[@id='sci_toolbox']/text[@find='cited_by']"/>
  </xsl:template>

  <xsl:template name="citedNotLinkedGoogle">
    <img src="/img/{$LANGUAGE}/iconCitedGoogleOff.gif"
      alt="{$translations/xslid[@id='sci_toolbox']/text[@find='on_index_process']}"/>
    <xsl:value-of select="$translations/xslid[@id='sci_toolbox']/text[@find='cited_by']"/>
  </xsl:template>

  <xsl:template match="fulltext-service[@id='cited_SciELO']" mode="label">
    <xsl:call-template name="cited"/> SciELO </xsl:template>

  <xsl:template match="fulltext-service[@id='cited_SciELO']" mode="labelNotLinked">
    <xsl:call-template name="citedNotLinked"/> SciELO </xsl:template>

  <xsl:template match="fulltext-service[@id='cited_Google']" mode="label">
    <xsl:call-template name="citedGoogle"/> Google </xsl:template>

  <xsl:template match="fulltext-service[@id='cited_Google']" mode="labelNotLinked">
    <xsl:call-template name="citedNotLinkedGoogle"/> Google </xsl:template>

  <xsl:template match="fulltext-service[@id='related']" mode="label">
    <img src="/img/{$LANGUAGE}/iconRelatedOn.gif"
      alt="{//ARTICLE/@RELATED} {$translations/xslid[@id='sci_toolbox']/text[@find='article']}(s)"
      /><xsl:value-of select="$translations/xslid[@id='sci_toolbox']/text[@find='similars_in']"/>
    SciELO </xsl:template>

  <xsl:template match="fulltext-service[@id='related']" mode="labelNotLinked">
    <img src="/img/{$LANGUAGE}/iconRelatedOff.gif"
      alt="{$translations/xslid[@id='sci_toolbox']/text[@find='have_no_similar_article']}"
      /><xsl:value-of select="$translations/xslid[@id='sci_toolbox']/text[@find='similars_in']"/>
    SciELO </xsl:template>

  <xsl:template match="fulltext-service[@id='related_Google']" mode="label">
    <img src="/img/{$LANGUAGE}/iconRelatedGoogleOn.gif"
      alt="{$translations/xslid[@id='sci_toolbox']/text[@find='indexed_by_google']}"/><xsl:value-of
      select="$translations/xslid[@id='sci_toolbox']/text[@find='similars_in']"/> Google </xsl:template>

  <xsl:template match="fulltext-service[@id='related_Google']" mode="labelNotLinked">
    <img src="/img/{$LANGUAGE}/iconRelatedGoogleOff.gif"
      alt="{$translations/xslid[@id='sci_toolbox']/text[@find='on_index_process']}"/><xsl:value-of
      select="$translations/xslid[@id='sci_toolbox']/text[@find='similars_in']"/> Google </xsl:template>

  <xsl:template match="fulltext-service[@id='send_mail']" mode="label">
    <img src="/img/{$LANGUAGE}/iconEmail.gif"/>
    <xsl:value-of
      select="$translations/xslid[@id='sci_toolbox']/text[@find='send_this_article_by_email']"/>
  </xsl:template>
  <xsl:template match="LANG|@ORIGINALLANG" mode="display-link-to-article-version">
    <xsl:param name="pid"/>
    <xsl:param name="label"/>
    <xsl:param name="script"></xsl:param>
    <xsl:param name="icon"></xsl:param>
    <xsl:variable name="lang" select="."/>
    <a>
      <xsl:call-template name="AddScieloLink">
        <xsl:with-param name="seq" select="$pid"/>
        <xsl:with-param name="script" select="$script"/>
        <xsl:with-param name="txtlang" select="."/>
      </xsl:call-template>
      <xsl:choose>
        <xsl:when test="position()=1">
          <img src="{$icon}"/>
          <xsl:value-of select="$label"/>
        </xsl:when>
        <xsl:otherwise> | </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of
        select="document(concat('../xml/',$interfaceLang,'/language.xml'))//language[@id=$lang]"/>
    </a>

  </xsl:template>
  <xsl:template match="LANG  |@ORIGINALLANG" mode="display-link-to-new-article-version">
    <xsl:param name="pid"/>
    <xsl:param name="label"/>
    <xsl:param name="icon"/>
    <xsl:variable name="lang" select="."/>
    <xsl:variable name="url">/article_plus.php?pid=<xsl:value-of select="$pid"
        />&amp;tlng=<xsl:value-of select="$lang"/>&amp;lng=<xsl:value-of select="$interfaceLang"
      /></xsl:variable>

    <a>
      <xsl:attribute name="href">javascript: void(0);</xsl:attribute>
      <xsl:attribute name="onClick">window.open('<xsl:value-of select="$url"
        />','','width=1000,height=480,resizable=yes,toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1');</xsl:attribute>
      <xsl:attribute name="rel">nofollow</xsl:attribute>
      <img src="{$icon}"/>

      <xsl:value-of select="$label"/>
    </a>

  </xsl:template>
</xsl:stylesheet>
>>>>>>> master
