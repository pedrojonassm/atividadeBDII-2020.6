CREATE FUNCTION add_milhagem()
    RETURNS TRIGGER
    LANGUAGE 'plpgsql'
    AS $$

BEGIN

    INSERT INTO milhas(cliente,quantidade) 
    values(new.codigo,0);

    RETURN NEW;

END;
$$;

CREATE TRIGGER adiciona_milhas
AFTER INSERT 
ON cliente
FOR EACH ROW
EXECUTE PROCEDURE add_milhagem();