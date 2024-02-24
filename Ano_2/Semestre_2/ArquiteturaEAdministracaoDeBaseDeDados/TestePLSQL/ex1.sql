create or replace function DURACAO_ULTIMO_INTERNAMENTO(
    utNIF NUMBER, 
    intEspec VARCHAR2, 
    ano NUMBER) return number is 

    cursor c1 is 
        select 
            it.data, te.duracao as duracao
        from 
            utente ut
            join internamento it on ut.codUtente = it.codUtente
            join termino te on it.codIntern = te.codIntern
        where 
            utente.nif = utNIF
            and it.especialidade = intEspec
            and to_char(it.dataIntern, 'YYYY') = ano
        order by 1;

    helper number;

begin
    select count(codUtente) into helper
    from utente
    where utente.nif = utNIF;
    if(helper <= 0) then
        raise_application_error(-20203, 'Utente com NIF '||utNIF||' inexistente');
    end if;

    select count(codUtente) into helper
    from utente ut
    join internamento it on ut.codUtente = it.codUtente
    where utente.nif = utNIF
    and it.especialidade = intEspec
    and to_char(it.dataIntern, 'YYYY') = ano;
    if(helper <= 0) then
        raise_application_error(-20201, 'Utente com NIF '||utNIF||' nao esteve internado na especialidade de '||intEspec||' nesse ano');
    end if;

    for i in c1 loop
        if(count(i.duracao) <= 0) then
            raise_application_error(-20202, 'O ultimo internamento do utente com NIF '||utNIF||' nesse ano, na especialidade de '||intEspec||' ainda nao terminou');
        else
            return i.duracao;
        end if;
    end loop;

end;
/