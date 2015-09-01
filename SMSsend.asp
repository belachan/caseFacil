<html>
<head>
<title>SMSsend.asp</title></head>
<body bgcolor="#ffffff" link="#FFFFFF"
vlink="#FFFFFF" alink="#FFFFFF">
<table width="100%" border="0"
cellspacing="0" cellpadding="0"
height="100%" align="center" vspace="0"
hspace="0">
<tr valign="top" align="center">
<td>
<table width="500" border="0"
cellspacing="0" cellpadding="0">
<tr>
<td width="600" height="100%"
valign="top">
s
</td>
</tr>
<tr>
<td width="600" height="100%"
valign="top">
<p><font color="#022941"><br>
<%

Set Mailer = Server.CreateObject("SMTPsvg.Mailer")
Mailer.FromName = "Nome"
Mailer.FromAddress= "email@host.pt"
Mailer.RemoteHost = "O seu host: ex.: mail.host.pt
"
Mailer.Priority = 1
Mailer.AddRecipient Request.Form("NomePara"),
Request.Form("emailpara")
Mailer.Subject = Request.Form("assunto")
Mailer.BodyText = Request.Form("mensagem")

if Mailer.SendMail
then
msgenv=1
else
msgenv=0
errol=Chr(34)& Mailer.Response &Chr(34)
end if

if msgenv=1 then
%> <br>
<font face="Verdana, Arial, Helvetica, sans-serif"
size="3"> A sua
mensagem foi enviada com sucesso para o n.º <%=session("Numero")%>.<br>
Aproveite tamb&eacute;m para <a href="default.htm"><font
size="3"><u>enviar</u></font></a>
a outra pessoa.<br>
</font><font color="#022941">
<%
else

%>
</font></font></p>
<form method="post" action="mailto:webmaster@netytal.pt?subject:
Erro no envio de SMS" name="SMS2">
<font color="#022941"><font face="Verdana,
Arial, Helvetica, sans-serif" size="3">Ocorreu
um erro ao enviar a mensagem.<br>
O erro foi:</font><font color="#022941"><%=errol%></font><font
face="Verdana, Arial, Helvetica, sans-serif">.<br>
Se este erro persistir reporte-o ao webmaster, usando
o bot&atilde;o
que se segue.<br>
Desde j&aacute; obrigado.<br>
<input type="hidden" name="Erro"
value="<%=errol%>">
<br>
<input type="submit" name="Submit"
value=" Notificar webmaster ">
</font>.</font> <br>
</form>
<%
end if

‘ Muito importante
!!! convém ter isto no final, pois assim acaba com qualquer
sessão !! e liberta o servidor…
session.abandon
%>
</td>
</tr>
</table>
</td>
</tr>
</table>
<br>
</body>