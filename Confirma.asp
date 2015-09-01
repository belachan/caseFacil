<html>
<head>
<%

‘ Dimensionando
as constantes.
dim denome
dim Numero
dim mensagem
dim errol
dim contagem
dim NumeroErrado
dim assunto
dim mailpara

‘ Através deste
passo recolhemos os dados do formulário


‘ O nome de quem
envia:
denome = Request.form("DeNome")

‘ O número do celular
para onde é enviada a mensagem:
Numero = Request.form("NumeroTelemovel")

‘ Isto é para que
o número passe de página para página…
session("Numero")=Numero

‘ Mensagem a enviar
Mensagem = Request.form("Mensagem")

‘ Vamos verificar se foi ultrapassado o limite de carateres.
‘ Eu usei 500 pois a OPTIMUS
‘aceita até 640 caracteres.
‘ Para que o serviço funcione pode-se diminuir de valor…
contagem=len(mensagem)

‘ Os valores do
goby serão referenciados de seguida.
If contagem>=500 Then
goby="0"
else
goby="1"
End If

‘ O assunto (Subject)
assunto="Mensagem enviada por " & denome
& "."

‘ Atribuimos um
valor para a constante NBumeroErrado, caso o 
‘número não comece por 91, 93 ou 96.
NumeroErrado="0"

‘Opera = aos primeiros
2 dígitos do número.
OPera=midB(Numero,1,3)

‘Para o caso o
número ser OPTIMUS
if OPera=93 then
mailpara=Numero&"@sms.optimus.pt"

‘caso contrário
else

‘para o caso seja
TMN, operadora de Portugal
if OPera=96 then
mailpara=Numero&"@mail.tmn.pt"

‘caso contrário
else

‘Para o caso ser
TELECEL, operadora de Portugal
if OPera=91 then
mailpara=Numero&"@sms.telecel.pt"
‘Caso não seja de nenhum, existe um erro, o número introduzido
é errado…
else
NumeroErrado="1"
end if

end if

end if


‘ Já temos valores
para apresentar resultados
‘ Já sabemos se foi ultrapassado o limite de caracteres
e se o número 
‘ que foi introduzido está correto.
‘ Se estas duas condições estiverem corretas, ótimo,
podemos
‘ prosseguir, caso contrário, teremos que corrigi-las.
%>
</head>
<body bgcolor="#ffffff" link="#FFFFFF"
vlink="#FFFFFF" alink="#FFFFFF">
<table width="100%" border="0"
cellspacing="0" cellpadding="0"
height="100%" align="center" vspace="0"
hspace="0">
<tr valign="top" align="center">
<td>
<table width="500" border="0"
cellspacing="0" cellpadding="0"
height="100%">
<tr align="center">
<td width="600" rowspan="3" height="100%"
valign="top"> <font face="Verdana,
Arial, Helvetica, sans-serif" size="5"
color="#022941">Confirma&ccedil;&atilde;o</font><br>
<br>
<%
‘ Caso o goby seja "0", significa que foi
ultrapassado o limite de caracteres…
if goby="0" then
%>
<table width="100%"
border="0" cellspacing="2" cellpadding="2">
<tr bgcolor="#022941">
<td><font face="Verdana, Arial, Helvetica,
sans-serif" size="4" color="#FFFFFF"><b>:.
Erro</b></font></td>
</tr>
<tr>
<td height="57"><font color="#022941"><font
face="Verdana, Arial, Helvetica, sans-serif">O
campo da mensagem não pode conter mais do que 500 caracteres.
</font></font></td>
</tr>
<tr bgcolor="#022941">
<td>
<input type="submit" name="Submit3"
value=" <<– Retroceder " onClick="parent.history.back();
return false;">
</td>
</tr>
</table>
<%
‘ Caso contrário, goby >< 0, passemos à fase seguinte,
número 
‘ correto ou número errado?
else

‘ Caso o número
esteja errado:
if NumeroErrado="1" then
%>
<table width="100%"
border="0" cellspacing="2" cellpadding="2">
<tr bgcolor="#022941">
<td><font face="Verdana, Arial, Helvetica,
sans-serif" size="4" color="#FFFFFF"><b>:.
Erro</b></font></td>
</tr>
<tr>
<td><font color="#022941"><br>
<font face="Verdana, Arial, Helvetica, sans-serif">Este
servi&ccedil;o
s&oacute; est&aacute; dispon&iacute;vel
apenas para redes portuguesas,
<b>Optimus </b>(93 xxx xx xx), <b>Telecel</b>
(91 xxx xx xx),
<b>TMN </b>(96 xxx xx xx).<br>
</font></font><font color="#022941"
face="Verdana, Arial, Helvetica, sans-serif">O
n&uacute;mero que voc&ecirc; introduziu (</font><font
color="#022941"><font face="Verdana,
Arial, Helvetica, sans-serif" size="3"><%=session("Numero")%></font></font><font
color="#022941" face="Verdana, Arial,
Helvetica, sans-serif">),

n&atilde;o
&eacute; de nenhum operador, deste modo, n&atilde;o
nos &eacute; poss&iacute;vel entregar a sua
mensagem.</font><br>
</td>
</tr>
<tr bgcolor="#022941">
<td>
<input type="submit" name="Submit33"
value=" <<– Retroceder " onClick="parent.history.back();
return false;">
</td>
</tr>
</table>
<font color="#022941"> </font>
<%

‘ Se chegamos a
este ponto, está todo correto, o utilizador pode 
‘ agora confirmar o envio ou então voltar para corrigir
algo.
Else

‘ agora criamos
mais um "form" com "Hidden Fields"
isto porque a componente que está instalada
‘no servidor que eu estou só aceita dados já atribuídos
ou através de
‘um "form", não aceita variáveis…
%>
<form method="post"
action="SMSsend.asp" name="SMSsend">
<table width="100%" border="0"
cellspacing="2" cellpadding="2">
<tr bgcolor="#022941">
<td><font color="#022941"><b><font
face="Verdana, Arial, Helvetica, sans-serif"
size="4" color="#FFFFFF">:.
Confirme se &eacute; isto que pretende enviar</font></b></font></td>
</tr>
<tr>
<td><font face="Verdana, Arial, Helvetica,
sans-serif" color="#022941">DE
:<br>
<font size="2">&nbsp;&nbsp;
<%=denome%>
</font><br>
<input type="hidden"
name="denome" value="<%=denome%>">
</font></td>
</tr>
<tr>
<td><font face="Verdana, Arial, Helvetica,
sans-serif" color="#022941">Para
: <br>
<font size="2">&nbsp;&nbsp;&nbsp;
<%
‘ Aqui dizemos qual aOperadora móvel em questão.
Response.Write session("Numero")

if MidB(session("Numero"),1,3)=93
then
Response.Write(" ( OPTIMUS )")
end if
if MidB(session("Numero"),1,3)=96 then
Response.Write(" ( TMN )")
end if
if MidB(session("Numero"),1,3)=91 then
Response.Write(" ( TELECEL )")
end if
%></font><br>

<input type="hidden"
name="NomePara" value="<%=session("Numero")%>">
<br>
<input type="hidden" name="emailpara"
value="<%=mailpara%>">
</font></td>
</tr>
<tr>
<td><font face="Verdana, Arial, Helvetica,
sans-serif" color="#022941">
<input type="hidden" name="assunto"
value="<%=assunto%>">
</font></td>
</tr>
<tr>
<td><font face="Verdana, Arial, Helvetica,
sans-serif" color="#022941">Mensagem:
<br>
<font size="2">&nbsp;&nbsp;&nbsp;<%=Mensagem%></font><br>
<input type="hidden" name="Mensagem"
value="<%=Mensagem2%>">
</font></td>
</tr>
<tr bgcolor="#022941">
<td>
<input type="submit" name="Submit"
value=" Sim, enviar. ">
<input type="submit" name="Submit32"
value=" N&atilde;o, retroceder. "
onClick="parent.history.back();
return false;">
</td>
</tr>
</table>
</form>
<p> <%

‘ Fechamos os IF’s…

end if
end if
%>
</td>
</tr>
<tr></tr>
<tr> </tr>
</table>
</td>
</tr>
</table>
<br>
</body>
</html>