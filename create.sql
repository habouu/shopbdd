create database bddshop;
use bddshop;

create table user (
    id int auto_increment not null,
    code int not null,
    lastname varchar(255) not null,
    firstname varchar(255) not null,
    email varchar(255) not null unique,
    password varchar(255) not null,
    token varchar(255) null,
    tokenExpireAt datetime null,
    lastLoginAt datetime null,
    constraint pk_user primary key (id)
);

create table address (
    id int auto_increment not null,
    lastname varchar(255) not null,
    firstname varchar(255) not null,
    address varchar(255) not null,
    city varchar(255) not null,
    country varchar(255) not null,
    phone varchar(255) not null,
    zipcode varchar(255) not null,
    user_id int not null,
    constraint pk_address primary key (id),
    constraint fk_address foreign key (user_id) references user(id)
);

create table purchase (
    id int auto_increment not null,
    createAt datetime not null,
    delivery longtext not null,
    state int not null,
    stripe longtext null,
    carrierName varchar(255) not null,
    carrierPrice decimal(5,2) not null,
    user_id int not null,
    constraint pk_purchase primary key (id),
    constraint fk_purchase foreign key (user_id) references user(id)
);

create table detail (
    id int auto_increment not null,
    productName varchar(255) not null,
    productImage varchar(255) not null,
    productQty int not null,
    productPrice decimal(5,2) not null,
    productTva decimal(5,2) not null,
    purchase_id int not null,
    constraint pk_detail primary key (id),
    constraint fk_detail foreign key (purchase_id) references purchase(id)
);

create table category (
    id int auto_increment not null,
    slug varchar(255) not null,
    name varchar(255) not null,
    constraint pk_category primary key (id)
);

create table product (
    id int auto_increment not null,
    slug varchar(255) not null,
    name varchar(255) not null,
    description longtext not null,
    image varchar(255) not null,
    price decimal(5,2) not null,
    tva decimal(5,2) not null,
    isBest tinyint(1) not null,
    category_id int not null,
    stock int not null default 50,
    constraint pk_product primary key (id),
    constraint fk_product foreign key (category_id) references category(id)
);

create table resetpassword (
    id int auto_increment not null,
    token varchar(255) not null,
    createdAt datetime not null,
    user_id int not null,
    constraint pk_resetpassword primary key (id),
    constraint fk_resetpassword foreign key (user_id) references user(id)
);

create table carrier (
    id int auto_increment not null,
    name varchar(255) not null,
    description varchar(255) not null,
    price decimal(5,2) not null,
    constraint pk_carrier primary key (id)
);

