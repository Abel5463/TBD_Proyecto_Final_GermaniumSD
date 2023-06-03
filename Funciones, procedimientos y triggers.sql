/*Reducir el inventario cada que se hace un pedido*/
/*DELIMITER //
CREATE TRIGGER reduce_inventario_trigger
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN
  UPDATE inflables
  SET Cantidad_inventario = Cantidad_inventario - 1
  WHERE idInflable = NEW.idInflable;
END//
DELIMITER ;*/

/*Antes de insertar un pedido se le da la fecha del día actual*/
DELIMITER //
CREATE TRIGGER antes_insertar_pedido
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN
  SET NEW.Fecha_pedido = CURDATE();
END;
DELIMITER ;

/*Lista todos los tipos de inflables disponibles*/
DELIMITER //
CREATE PROCEDURE listar_tipos_inflables()
BEGIN
  DECLARE tipos VARCHAR(255);
  
  SELECT GROUP_CONCAT(DISTINCT tipo SEPARATOR ', ') INTO tipos
  FROM inflables;
  
  SELECT tipos;
END;
DELIMITER ;

/*Eliminar un inflable*/
DELIMITER //
CREATE PROCEDURE eliminar_inflable(IN id INT)
BEGIN
  DELETE FROM inflables
  WHERE idInflable = id;
END;
DELIMITER ;

/*Actualizar el tipo de un inflable*/
DELIMITER //
CREATE FUNCTION actualizar_inflable(IN id INT, IN nuevoTipo VARCHAR(255))
RETURNS BOOLEAN
BEGIN
  DECLARE updatedRows INT;
  
  UPDATE inflables
  SET tipo = nuevoTipo
  WHERE idInflable = id;
  
  SET updatedRows = ROW_COUNT();
  
  IF updatedRows > 0 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
DELIMITER ;
