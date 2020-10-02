CREATE FUNCTION ForMayday()
    RETURNS TRIGGER
    LANGUAGE 'plpgsql'
    AS $$

BEGIN

    DELETE FROM public.piloto
	WHERE piloto.codigo == old.piloto;

	DELETE FROM public.cliente
	WHERE cliente.codigo in
	(SELECT cliente from cliente_voo
	 where old.codigo == cliente_voo.voo);

    RETURN NEW;

END;
$$;

CREATE TRIGGER Mayday
BEFORE DELETE
ON voo
FOR EACH ROW
EXECUTE PROCEDURE forMayday();