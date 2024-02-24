create or replace procedure internamentos_cidade(
    vcidade varchar2,
    vano number
) is
    cursor c1 is
        select 
            ut.nome as utnome, it.especialidade as itespec, ut.nif as utnif
        from
            utente ut
            join internamento it on ut.codUtente = it.codUtente
            join medico me on it.codMedico = me.codMedico
        where
            ut.morada = vcidade
            and me.morada = vcidade
            and to_char(it.data, 'YYYY') = vano;

    errNIF exception;
    pragma exception_init (errNIF, -20203);

    errESP exception;
    pragma exception_init (errESP, -20201);

    errEST exception;
    pragma exception_init (errEST, -20202);

    i c1%rowtype;

begin
    delete from temp;

    for i in c1 loop
        insert into temp values(vano, DURACAO_ULTIMO_INTERNAMENTO(i.utnif, i.itespec, vano), i.utnome, i.itespec);
    end loop;

exception
    when errEST then
        insert into temp values(vano, -20202, i.utnome, i.itespec);

end;
/