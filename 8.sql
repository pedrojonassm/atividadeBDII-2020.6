create trigger Mayday after
delete on voo
DELETE FROM public.piloto
	WHERE piloto.codigo == new.piloto,
DELETE FROM public.cliente
	WHERE cliente.codigo in
	(SELECT cliente from cliente_voo
	 where new.codigo == cliente_voo.voo);