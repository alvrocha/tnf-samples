## Security Sample

Este exemplo mostra como configurar a seguran�a em uma API utilizando o Tnf com o Tnf-Rac (servidor de authentica��o do Tnf).

Na raiz do projeto existe uma pasta chamada "Rac" com dois arquivos .cmd:
	
	- _ExecuteMigrator.cmd: execute para gerar as migra��es;
	- _StartRacInfrastructure.cmd: execute para subir o Tnf-Rac;
	

Tanto o Tnf-Rac quanto este exemplo est�o configurados para rodar em SqLite por default. Em ambos
essa configura��o pode ser alterada nos arquivos de configura��o atrav�s do par�metro "DefaultConnectionString".

OBS: Se voc� alterar a base de dados, certifique-se de que a configura��o das connections string apontem para uma inst�ncia
existente.

Ao subir o Tnf-Rac executando o arquivo mencionado acima "_StartRacInfrastructure.cmd" voc� poder� executar o projeto
Security.Web.

O projeto Security.Web cont�m duas APIS:
	
	- Customer: estar� fechada precisando de autentica��o para ser acessada devido ao uso do atributo TnfAuthorize decorando o controller "CustomerController";
	- Product: estar� aberta sem necessidade de autentica��o.

Para realizar a authentica��o pelo swagger rode a aplica��o acessando a url http://localhost:5055/swagger e clique no bot�o
"Authorize". Na janela que ir� abrir voc� dever� selecionar os escopos e clicar no bot�o Authorize sendo dessa forma redirecionado para o Tnf-Rac para que voc�
possa realizar o login utilizando o usu�rio "admin" e a senha "123qwe".

Para acessar a tela de gerenciamento do Tnf-Rac acesse http://localhost:5002, utilizando o mesmo usu�rio e senha mencionado acima.