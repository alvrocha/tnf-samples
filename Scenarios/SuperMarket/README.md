### Super Market

Este exemplo cont�m um cen�rio simples de cria��o de um pedido utilizando o TNF com Redis e Rabbitmq e SqlServer.

Toda vez que um pedido � criado/alterado ser� gerado um evento (mensageria) que ser� consumido por outro servi�o respons�vel pelo c�lculo
do imposto.
Ap�s este c�lculo ser efetuado ser� gerado outro evento (mensageria) para atualiza��o do pedido, onde ser�o atualizadas informa��es, sobre o imposto gerado e o valor total recalculado
na opera��o.

O exemplo foi separado em 3 contextos: Cruds, Sales e FiscalService.
Ambos utilizam bancos de dados separados para fins de exemplo.
Todos utilizam SqlServer e a troca de mensagens entre o servi�o de Sales e FiscalService se da atrav�s do Rabbitmq.

#### Instala��o

##### Configs e banco de dados

Para que este exemplo funcione voc� precisa ter o LocalDb instalado em seu visual studio ou configurar uma instancia v�lida do SqlServer
nos config da aplica��o nos projetos
	
	SuperMarket.Backoffice.Crud.Web
		appsettings.Development.json e 
		appsettings.Production.json

	SuperMarket.Backoffice.Sales.Web
		appsettings.Development.json e 
		appsettings.Production.json

	SuperMarket.FiscalService.Web
		appsettings.Development.json e 
		appsettings.Production.json

##### Mensageria

Para que a mensageria funcione o Rabbitmq ter� de ser instalado e configurado para o protocolo AMQP estar habilitado.
Para mais detalhes de como habilitar o protocolo AMQP no Rabbitmq e para aprender mais sobre conceitos relacionados
a mensageria acesse (http://tdn.totvs.com/display/TNF/Mensageria)

Para instalar via windows: (https://www.rabbitmq.com/install-windows.html)

Para instalar via docker: 
* Instale o docker
* Execute os comandos (o primeiro comando ir� criar o container e os outros 3 ir�o habilitar o protocolo AMQP):
	* docker run -d --hostname rabbitmq --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.7.3-management-alpine
	* docker exec -it rabbitmq bash
	* cd plugins
	* rabbitmq-plugins enable rabbitmq_amqp1_0

##### Redis Cache

Para instalar via windows: (https://github.com/rgl/redis/downloads)

Para instalar via docker:
* Instale o docker
* Execute o comando:
	* docker run --name redis -d -p 6379:6379 -i -t redis:3.2.11-alpine