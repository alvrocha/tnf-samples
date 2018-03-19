#### Messaging

##### Exemplo de um projeto utilizando a abstra��o de fila do TNF com Rabbitmq.

Este exemplo cont�m duas APIs (Messaging.Web1 e Messaging.Web2) que ir�o se comunicar atrav�s de mensageria, onde a API Messaging.Web1 ir� publicar essa mensagem e a Messaging.Web2
ir� assinar e cachear essa mensagem na mem�ria.
Ambas possuem o swagger configurado para que voc� possa testar esse processo manualmente.
O projeto tamb�m possui um projeto console Messaging.Client exemplificando o envio de mensagens atrav�s de um projeto externo.

Para rodar os tr�s projetos clique com o bot�o direito em cima da solu��o no visual studio e clique em propriedades.
Na janela de propriedades marque na coluna "Action" os projetos Messaging.Client, Messaging.Web1 e Messaging.Web2 para "Start".
Ap�s alterar essa configura��o quando voc� executar as aplica��es atrav�s da tecla F5 os 3 projetos ir�o rodar em modo Debug.

##### Instala��o

Para que este exemplo funcione voc� precisa ter o Rabbitmq instalado com o protocolo AMQP habilitado.
Para mais detalhes de como habilitar o protocolo AMQP no Rabbitmq e para aprender mais sobre conceitos relacionados
a mensageria acesse (http://tdn.totvs.com/display/TNF/Mensageria)

Para instalar via windows: https://www.rabbitmq.com/install-windows.html
Para instalar via docker: 
* Instale o docker
* Execute os comandos (o primeiro comando ir� criar o container e os outros 3 ir�o habilitar o protocolo AMQP):
	docker run -d --hostname rabbitmq --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.7.3-management-alpine
	docker exec -it rabbitmq bash
	cd plugins
	rabbitmq-plugins enable rabbitmq_amqp1_0
