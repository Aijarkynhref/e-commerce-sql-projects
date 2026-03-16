CREATE TABLE products (product_name VARCHAR(500),barcode VARCHAR(50)       
);

SELECT p_old.*
FROM products p_old
WHERE p_old.barcode NOT LIKE 'HH%'
  AND EXISTS (
    SELECT 1
    FROM products p_new
    WHERE p_new.barcode LIKE 'HH%'
      AND p_new.product_name LIKE p_old.product_name || '%'
  );
