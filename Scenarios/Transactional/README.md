### Transactional Sample

## Este exemplo contempla um cen�rio transacional.

# Existem duas formas de controlar esse comportamento no TNF:
	
* Manual: de forma explicita no c�digo atrav�s da inje��o da interface IUnitOfWorkManager que possui
  m�todos para iniciar ".Begin()" e ".Complete" para comitar as altera��es;

* Autom�tico: de forma impl�cita a utiliza��o desta op��o acarreta na cria��o de um UnitOfWork para cada request realizado.
  Isso se d� ao fato da utiliza��o do pacote Tnf.Repositories.AspNetCore que possui al�m das depend�ncias
  de AspNetCore, um middleware que pode ser chamado no Startup de sua aplica��o ".UseTnfUnitOfWork()" para ser adicionado ao pipeline de sua API 
  garantindo que cada request tenha um Unit Of Work presente.

# Dependendo do TransactionScopeOption utilzado na cria��o de um Uow atrav�s do m�todo ".Begin()" o controle transacional funcionar� com descrito a seguir:

* Required: Uma transa��o � exigida. Ele ir� criar uma transa��o se esta n�o existir ainda. Caso voc� crie transa��es aninhandas com o mesmo
  TransactionScopeOption definido para Required o Unit Of Work n�o ir� criar mais transa��es e manter� apenas a que foi criada anteriormente para comit�-la ao final
  deste escopo. Este � o valor default ao criar um Unit Of Work

* RequiresNew: Uma transa��o nova sempre ser� criada para aquele escopo.

* Suppress: O contexto da transa��o � suprimdo. Todas as opera��es dentro deste escopo ser�o feitos sem um contexto de transa��o.

# Para alterar esse valores a n�vel de aplica��o voc� deve configurar o UnitOfWorkOptions. Isso pode ser feito de duas maneiras:

* Atrav�s do Startup de sua aplica��o, configurando atrav�s do m�todo .UseTnfAspNetCore:
	
	public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILogger<Startup> logger)
	{
		app.UseTnfAspNetCore(options =>
        {
			// ---------- Configura��es de Unit of Work a n�vel de aplica��o

            // Por padr�o um Uow � transacional: todas as opera��es realizadas dentro de um Uow ser�o
            // comitadas ou desfeitas em caso de erro
            options.UnitOfWorkOptions().IsTransactional = true;

            // IsolationLevel default de cada transa��o criada. (Precisa da configura��o IsTransactional = true para funcionar)
            options.UnitOfWorkOptions().IsolationLevel = IsolationLevel.ReadCommitted;

            // Escopo da transa��o. (Precisa da configura��o IsTransactional = true para funcionar)
            options.UnitOfWorkOptions().Scope = TransactionScopeOption.Required;

            // Timeout que ser� aplicado (se este valor for informado) para toda nova transa��o criada
			// N�o � indicado informar este valor pois ir� afetar toda a aplica��o.
            options.UnitOfWorkOptions().Timeout = TimeSpan.FromSeconds(5);

            // ----------
		});
	}

* Outra op��o � acessar via uma extens�o baseado no IServiceProvider:

	public void Configure(IServiceProvider provider)
	{
		// ---------- Configura��es de Unit of Work a n�vel de aplica��o

        // Por padr�o um Uow � transacional: todas as opera��es realizadas dentro de um Uow ser�o
        // comitadas ou desfeitas em caso de erro
		provider.ConfigureTnf().UnitOfWorkOptions().IsTransactional = true;

		// IsolationLevel default de cada transa��o criada. (Precisa da configura��o IsTransactional = true para funcionar)
        provider.UnitOfWorkOptions().IsolationLevel = IsolationLevel.ReadCommitted;

        // Escopo da transa��o. (Precisa da configura��o IsTransactional = true para funcionar)
        provider.UnitOfWorkOptions().Scope = TransactionScopeOption.Required;

        // Timeout que ser� aplicado (se este valor for informado) para toda nova transa��o criada
        provider.UnitOfWorkOptions().Timeout = TimeSpan.FromSeconds(5);

        // ----------
	}

Neste exemplo � contemplado apenas o cen�rio Manual, onde todo acesso a um Repository est� sendo criado um Unit Of Work de forma explic�ta.