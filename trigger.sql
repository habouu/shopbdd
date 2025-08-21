DELIMITER $$

create trigger trg_after_insert_detail
    before insert on detail
    for each row
begin
    declare current_stock int;

    -- Récupérer le stock actuel du produit
    select stock into current_stock
    from product
    where id = new.product_id;

    -- Vérifier si le stock est suffisant
    if current_stock < new.productQty then
        signal sqlstate '45000'
        set message_text = 'Stock insuffisant pour ce produit';
    else
        -- Décrémenter le stock
        update product
        set stock = stock - new.productQty
        where id = new.product_id;
    end if;
end$$

DELIMITER ;
