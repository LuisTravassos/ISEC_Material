create or replace trigger update_internamentos
    after insert on termino
    for each row

declare
    utnif number;
    ano number;
    intEspec varchar2;
    utnome varchar2;
    errcol2 number;

begin
    select it.especialidade, to_char(it.dataIntern, 'YYYY'), ut.nif, ut.nome
    into intEspec, ano, utnif, utnome
    from utente ut
    join internamento it on ut.codUtente = it.codUtente
    where it.codIntern = :new.codIntern;

    select col2 into errcol2
    from temp
    where col1 = ano
    and message1 = utnome
    and message2 = intEspec;

    if(errcol2 <= 0) then
        update temp
            set col2 = DURACAO_ULTIMO_INTERNAMENTO(utnif, intEspec, ano)
            where col1 = ano
            and message1 = utnome
            and message2 = intEspec;
    end if;

end;
/