--ALTER TABLE tbl_livros ACTION;

--ALTER TABLE tbl_cliente ADD CONSTRAINT idade CHECK 
--(idade >10);
--ALTER TABLE tbl_cliente RENAME CONSTRAINT idade TO
--idades;
--ALTER TABLE tbl_cliente DROP CONSTRAINT idades;

create domain chk_categoriaa text check (value='DRAMA' or value='comedia');
create domain chk_status text check (value='DISPONIVEL' or value='ALUGADO');

ALTER TABLE IF EXISTS public.tbl_emprestimo
    ADD CONSTRAINT chk_FK FOREIGN KEY (codigo_client)
    REFERENCES public.tbl_cliente (codigo_cliente) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;