#### Querying

Para que este exemplo funcione voc� precisa ter o LocalDb instalado em seu visual studio ou configurar uma instancia v�lida do SqlServer
nos config da aplica��o no projeto
	
	Querying.Web 
		appsettings.Development.json e 
		appsettings.Production.json.

Exemplo de um projeto fazendo consultas atrav�s do reposit�rio do TNF.

Neste projeto voc� ir� encontrar exemplo de consultas:
* N pra N
* 1 pra N
* Atributo Fields do objeto RequestDto para carregar campos de uma entidade do banco de dados
* Atributo Expand do objeto RequestDto para carregar relacionamentos de uma entidade do banco de dados