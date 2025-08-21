insert into user (id, code, lastname, firstname, email, password) values
(1, 1001, 'Dupont', 'Jean', 'jean.dupont@email.com', 'password'),
(2, 1002, 'Martin', 'Claire', 'claire.martin@email.com', 'password'),
(3, 1003, 'Durand', 'Paul', 'paul.durand@email.com', 'password');

insert into address (id, lastname, firstname, address, city, country, phone, zipcode, user_id) values
(1, 'Dupont', 'Jean', '12 rue de Paris', 'Paris', 'France', '0601020304', '75000', 1),
(2, 'Martin', 'Claire', '45 avenue Victor Hugo', 'Lyon', 'France', '0605060708', '69000', 2);

insert into category (id, slug, name) values
(1, 'informatique', 'Informatique'),
(2, 'gaming', 'Gaming'),
(3, 'mobilier', 'Mobilier');

insert into product (id, slug, name, description, image, price, tva, isBest, stock, category_id) values
(1, 'clavier-meca', 'Clavier mécanique', 'Clavier gamer rétroéclairé RGB', 'clavier.jpg', 89.99, 20, 0, 10, 1),
(2, 'souris-gamer', 'Souris gaming', 'Souris ergonomique avec 7 boutons programmables', 'souris.jpg', 49.99, 20, 1, 15, 2),
(3, 'ecran-27', 'Écran 27"', 'Écran 4K Ultra HD 27 pouces', 'ecran.jpg', 299.99, 20, 1, 5, 1),
(4, 'chaise-bureau', 'Chaise de bureau', 'Chaise ergonomique pour travailler confortablement', 'chaise.jpg', 159.99, 20, 0, 8, 3);

insert into purchase (id, createAt, delivery, state, stripe, carrierName, carrierPrice, user_id) values
(1, NOW(), '12 rue de Paris, 75000 Paris', 0, NULL, 'Colissimo', 5.99, 1);

insert into detail (id, productName, productImage, productQty, productPrice, productTva, purchase_id) values
(1, 'Clavier mécanique', 'clavier.jpg', 2, 89.99, 20, 1);

update product
set stock = stock - 2
where slug = 'clavier-meca' and stock >= 2;